import 'package:flutter/material.dart';

import '../../../business_logic/models/question.dart';
import '../../theme/style.dart';
import 'multiple_choice_question_widget.dart';

class MultipleChoiceAnswerWidget extends StatelessWidget {
  final AnswerChoice choice;
  final EdgeInsets padding;
  final Function onTap;
  final Color color;

  static const double spaceMultiplier = MultipleChoiceQuestionWidget.spaceMultiplier;
  static final BorderRadius br = MultipleChoiceQuestionWidget.br;

  MultipleChoiceAnswerWidget(this.choice, this.padding, this.onTap, [this.color = Colors.white]);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);

    return Expanded(
      child: Padding(
        padding: padding,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: br),
          child: InkWell(
            splashColor: (choice.isCorrect ? correctColor : incorrectColor),
            onTap: () => onTap(choice),
            borderRadius: br,
            child: Container(
              width: mq.size.width,
              child: Text(
                choice.content,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
