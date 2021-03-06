import 'dart:async';

import 'package:flutter/material.dart';

import '../../../business_logic/models/question.dart';
import '../../theme/style.dart';
import '../question_widgets.dart';
import 'question_data_widget.dart';

class TrueFalseWidget extends StatefulWidget implements QuestionWidget {
  final TrueFalseQuestionData data;
  final int questionNumber;
  final void Function() nextQuestion, previousQuestion;

  const TrueFalseWidget(
    this.data,
    this.questionNumber, {
    this.nextQuestion,
    this.previousQuestion,
  });

  @override
  _TrueFalseWidgetState createState() => _TrueFalseWidgetState();
}

class _TrueFalseWidgetState extends State<TrueFalseWidget> {
  void select(bool selected) {
    widget.data.selected = selected;
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
        TrueFalseAnswerWidget(
          true,
          (widget.data.selected == null ? false : widget.data.selected),
          select,
        ),
        TrueFalseAnswerWidget(
          false,
          (widget.data.selected == null ? false : !widget.data.selected),
          select,
        ),
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
                  (choice ? 'True' : 'False'),
                  style: isSelected ? answeredChoice : regularChoice,
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
