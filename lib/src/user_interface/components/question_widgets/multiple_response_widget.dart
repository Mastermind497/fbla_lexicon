import 'dart:async';

import 'package:flutter/material.dart';

import '../../../business_logic/models/question.dart';
import 'multiple_answer_widget.dart';
import 'question_data_widget.dart';

class MultipleResponseWidget extends StatefulWidget {
  final MultipleResponseQuestionData data;
  final int questionNumber;
  final void Function() nextQuestion, previousQuestion;

  void select(AnswerChoice selected) => data.add(selected);

  void remove(AnswerChoice selected) => data.remove(selected);

  List<AnswerChoice> get selected => data.selected;

  MultipleResponseWidget(
    this.data,
    this.questionNumber, {
    this.nextQuestion,
    this.previousQuestion,
  });

  @override
  _MultipleResponseWidgetState createState() => _MultipleResponseWidgetState();
}

class _MultipleResponseWidgetState extends State<MultipleResponseWidget> {
  List<MultipleAnswerWidget> get getAnswerChoices {
    var answerChoices = <MultipleAnswerWidget>[];
    if (widget.selected.isEmpty) {
      for (var choice in widget.data.choices) {
        answerChoices.add(
          MultipleAnswerWidget(
            choice,
            updateChosen,
            false,
            true,
          ),
        );
      }
    } else {
      for (var choice in widget.data.choices) {
        answerChoices.add(
          MultipleAnswerWidget(
            choice,
            updateChosen,
            (widget.selected.contains(choice)),
            true,
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
