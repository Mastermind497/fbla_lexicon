import 'dart:async';

import 'package:flutter/material.dart';

import '../../../business_logic/models/question.dart';
import '../question_widgets.dart';
import 'multiple_answer_widget.dart';
import 'question_data_widget.dart';

class MultipleChoiceWidget extends StatefulWidget implements QuestionWidget {
  final MultipleChoiceQuestionData data;
  final int questionNumber;
  final void Function() nextQuestion, previousQuestion;

  set selected(AnswerChoice selected) => data.selected = selected;

  AnswerChoice get selected => data.selected;

  const MultipleChoiceWidget(
    this.data,
    this.questionNumber, {
    this.nextQuestion,
    this.previousQuestion,
  });

  @override
  _MultipleChoiceWidgetState createState() => _MultipleChoiceWidgetState();
}

class _MultipleChoiceWidgetState extends State<MultipleChoiceWidget> {
  List<MultipleAnswerWidget> get getAnswerChoices {
    final answerChoices = <MultipleAnswerWidget>[];
    if (widget.selected == null) {
      for (var choice in widget.data.choices) {
        answerChoices.add(
          MultipleAnswerWidget(choice, updateChosen, false),
        );
      }
    } else {
      for (var choice in widget.data.choices) {
        answerChoices.add(
          MultipleAnswerWidget(
            choice,
            updateChosen,
            choice == widget.selected,
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
        QuestionDataWidget(
          widget.data,
          widget.questionNumber,
          next: widget.nextQuestion,
          previous: widget.previousQuestion,
        ),
        ...getAnswerChoices,
      ],
    );
  }
}
