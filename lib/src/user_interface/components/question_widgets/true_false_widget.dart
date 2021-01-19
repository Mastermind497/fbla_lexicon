import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fbla_lexicon/src/user_interface/theme/style.dart';
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
  bool selected;

  void select(bool selected) {
    this.selected = selected;
    Future.delayed(Duration(milliseconds: 145), () => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionDataWidget(
          widget.data,
          widget.questionNumber,
          size: 0.45,
          next: widget.nextQuestion,
          previous: widget.previousQuestion,
        ),
        TrueFalseAnswerWidget(true, (selected == null ? false : selected), select),
        TrueFalseAnswerWidget(false, (selected == null ? false : !selected), select),
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
                  child: Text(
                (choice ? "True" : "False"),
                style: isSelected ? answeredChoice : regularChoice,
                textAlign: TextAlign.center,
              )),
            ),
          ),
        ),
      ),
    );
  }
}
