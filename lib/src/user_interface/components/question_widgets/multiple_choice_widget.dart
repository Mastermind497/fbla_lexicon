import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../business_logic/models/question.dart';
import '../../theme/style.dart';
import 'question_data_widget.dart';

class MultipleChoiceWidget extends StatefulWidget {
  final MultipleChoiceQuestionData data;
  final int questionNumber;
  final void Function() nextQuestion, previousQuestion;

  set selected(AnswerChoice selected) => data.selected = selected;

  AnswerChoice get selected => data.selected;

  MultipleChoiceWidget(this.data, this.questionNumber, {this.nextQuestion, this.previousQuestion});

  @override
  _MultipleChoiceWidgetState createState() => _MultipleChoiceWidgetState();
}

class _MultipleChoiceWidgetState extends State<MultipleChoiceWidget> {
  List<MultipleChoiceAnswerWidget> get getAnswerChoices {
    var answerChoices = <MultipleChoiceAnswerWidget>[];
    if (widget.selected == null) {
      for (var choice in widget.data.choices) {
        answerChoices.add(
          MultipleChoiceAnswerWidget(choice, updateChosen),
        );
      }
    } else {
      for (var choice in widget.data.choices) {
        answerChoices.add(
          MultipleChoiceAnswerWidget(
            choice,
            updateChosen,
            (choice == widget.selected ? fblaBlue : Colors.white),
          ),
        );
      }
    }

    return answerChoices;
  }

  void updateChosen(AnswerChoice selected) {
    widget.selected = selected;
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

class MultipleChoiceAnswerWidget extends StatelessWidget {
  final AnswerChoice choice;
  final void Function(AnswerChoice) onTap;
  final Color color;

  MultipleChoiceAnswerWidget(this.choice, this.onTap, [this.color = Colors.white]);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: createPadding(context),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          margin: createMargin(context),
          color: color,
          child: InkWell(
            splashColor: fblaBlue,
            onTap: () => onTap(choice),
            borderRadius: borderRadius,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: AutoSizeText(
                  choice.content,
                  style: (color == Colors.white ? regularChoice : answeredChoice),
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
