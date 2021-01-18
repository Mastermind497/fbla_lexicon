import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../../business_logic/models/question.dart';
import '../../../theme/style.dart';

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
