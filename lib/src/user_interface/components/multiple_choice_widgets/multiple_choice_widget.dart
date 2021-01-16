import 'dart:async';

import 'package:flutter/material.dart';

import '../../../business_logic/models/question.dart';
import 'multiple_choice_question_widget.dart';
import 'multiple_choice_choices_widget.dart';
import 'multiple_choice_answer_widget.dart';

class MultipleChoiceWidget extends StatefulWidget {
  final MultipleChoiceQuestionData data;
  final int questionNumber;

  void Function(AnswerChoice) nextQuestion;

  AnswerChoice selected;

  MultipleChoiceWidget(this.data, this.questionNumber);

  @override
  _MultipleChoiceWidgetState createState() => _MultipleChoiceWidgetState(data);
}

class _MultipleChoiceWidgetState extends State<MultipleChoiceWidget> {
  final MultipleChoiceChoicesWidget choicesWidget;
  List<MultipleChoiceAnswerWidget> answerChoices;

  _MultipleChoiceWidgetState(MultipleChoiceQuestionData data)
      : choicesWidget = MultipleChoiceChoicesWidget(data.choices) {
    choicesWidget.onTap = updateChosen;
    answerChoices = [...choicesWidget.answerChoices];
  }

  void updateChosen(AnswerChoice selected) {
    widget.selected = selected;
    Future.delayed(Duration(milliseconds: 155), () {
      choicesWidget.selected = selected;
      setState(() {
        answerChoices = choicesWidget.getAfterChosen;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MultipleChoiceQuestionWidget(widget.data, widget.questionNumber),
        ...answerChoices,
      ],
    );
  }
}
