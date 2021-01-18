import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../business_logic/models/question.dart';
import 'question_data_widget.dart';

class TrueFalseWidget extends StatefulWidget {
  final TrueFalseQuestionData data;
  final int questionNumber;
  final void Function() nextQuestion, previousQuestion;

  TrueFalseWidget(this.data, this.questionNumber, {this.nextQuestion, this.previousQuestion});

  @override
  _TrueFalseWidgetState createState() => _TrueFalseWidgetState();
}

class _TrueFalseWidgetState extends State<TrueFalseWidget> {
  TrueFalseAnswerWidget trueWidget;
  TrueFalseAnswerWidget falseWidget;
  QuestionDataWidget questionWidget;

  _TrueFalseWidgetState() {
    trueWidget = TrueFalseAnswerWidget(true, false, select);
    falseWidget = TrueFalseAnswerWidget(false, false, select);
    questionWidget = QuestionDataWidget(widget.data, widget.questionNumber);
  }

  void select(bool selected) {
    if (selected)
      trueWidget = TrueFalseAnswerWidget(true, true, select);
    else
      falseWidget = TrueFalseAnswerWidget(false, true, select);

    Future.delayed(Duration(milliseconds: 145), () => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        questionWidget,
        trueWidget,
        falseWidget,
      ],
    );
  }
}

class TrueFalseAnswerWidget extends StatelessWidget {
  final bool choice;
  final bool isSelected;
  final void Function(bool) onTap;

  TrueFalseAnswerWidget(this.choice, this.isSelected, this.onTap);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText("Here Lies $choice");
  }
}
