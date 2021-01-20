import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../business_logic/models/question.dart';
import '../../theme/style.dart';

class MultipleAnswerWidget extends StatelessWidget {
  final AnswerChoice choice;
  final void Function(AnswerChoice) onTap;
  final bool isSelected;
  final bool multipleAnswers;

  const MultipleAnswerWidget(
    this.choice,
    this.onTap,
    this.isSelected, [
    this.multipleAnswers = false,
  ]);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: createPadding(context),
        child: Card(
          shape: rectangleBorder,
          margin: createMargin(context),
          child: InkWell(
            splashColor: multipleAnswers & isSelected ? Colors.white : fblaBlue,
            onTap: () => onTap(choice),
            borderRadius: borderRadius,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: AutoSizeText(
                  choice.content,
                  style: (isSelected ? answeredChoice : regularChoice),
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          color: isSelected ? fblaBlue : Colors.white,
        ),
      ),
    );
  }
}
