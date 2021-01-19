import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';

import '../../../business_logic/models/question.dart';
import '../../theme/style.dart';
import 'package:flutter/material.dart';

import 'question_data_widget.dart';

class MultipleResponseWidget extends StatefulWidget {
  final MultipleResponseQuestionData data;
  final int questionNumber;
  final void Function() nextQuestion, previousQuestion;

  void select(AnswerChoice selected) => data.add(selected);

  void remove(AnswerChoice selected) => data.remove(selected);

  List<AnswerChoice> get selected => data.selected;

  MultipleResponseWidget(this.data, this.questionNumber,
      {this.nextQuestion, this.previousQuestion});

  @override
  _MultipleResponseWidgetState createState() => _MultipleResponseWidgetState();
}

class _MultipleResponseWidgetState extends State<MultipleResponseWidget> {
  List<MultipleResponseAnswerWidget> get getAnswerChoices {
    var answerChoices = <MultipleResponseAnswerWidget>[];
    if (widget.selected.isEmpty) {
      for (var choice in widget.data.choices) {
        answerChoices.add(
          MultipleResponseAnswerWidget(choice, updateChosen, false),
        );
      }
    } else {
      for (var choice in widget.data.choices) {
        answerChoices.add(
          MultipleResponseAnswerWidget(
            choice,
            updateChosen,
            (widget.selected.contains(choice)),
          ),
        );
      }
    }

    return answerChoices;
  }

  void updateChosen(AnswerChoice selected) {
    if (widget.selected.contains(selected))
      widget.remove(selected);
    else
      widget.select(selected);

    Future.delayed(Duration(milliseconds: 145), () => setState(() {}));

    print(widget.selected);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionDataWidget(widget.data, widget.questionNumber),
        ...getAnswerChoices,
      ],
    );
  }
}

class MultipleResponseAnswerWidget extends StatelessWidget {
  final AnswerChoice choice;
  final void Function(AnswerChoice) onTap;
  final bool isSelected;

  MultipleResponseAnswerWidget(this.choice, this.onTap, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: createPadding(context),
        child: Card(
          shape: rectangleBorder,
          margin: createMargin(context),
          color: isSelected ? fblaBlue : Colors.white,
          child: InkWell(
            splashColor: fblaBlue,
            onTap: () => onTap(choice),
            borderRadius: borderRadius,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: AutoSizeText(
                  choice.content,
                  style: (isSelected ? regularChoice : answeredChoice),
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
