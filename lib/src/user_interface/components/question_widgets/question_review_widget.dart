import 'package:flutter/material.dart';

import '../../../business_logic/models/question.dart';
import '../../theme/style.dart';

class QuestionReview extends StatelessWidget {
  final QuestionData _questionData;
  final int _questionNumber;
  final TextStyle headingStyle, bodyStyle;
  final bool withInkwell;
  final void Function() onTap;

  QuestionReview(
    this._questionData, [
    this._questionNumber,
    this.withInkwell = false,
    this.onTap,
  ])  : headingStyle = _questionData.isCorrect
            ? selectionHeadingCorrect
            : selectionHeadingIncorrect,
        bodyStyle = _questionData.isCorrect
            ? selectionBodyCorrect
            : selectionBodyIncorrect;

  Widget get widgetContent {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text:
                    'Question${(_questionNumber == null ? '' : ' $_questionNumber')}: ',
                style: headingStyle,
              ),
              TextSpan(
                text: '${_questionData.question}',
                style: bodyStyle,
              )
            ]),
          ),
          extraSpacing,
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Your Answer: ',
                  style: headingStyle,
                ),
                TextSpan(
                  text: _questionData.getSelected,
                  style: bodyStyle,
                )
              ],
            ),
          ),
          extraSpacing,
          if (!_questionData.isCorrect)
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                style: bodyStyle,
                children: [
                  TextSpan(
                    text: 'Correct Answer: ',
                    style: headingStyle,
                  ),
                  TextSpan(text: _questionData.correctAnswer),
                ],
              ),
            ),
          if (_questionData.isCorrect)
            RichText(
              text: correctText,
              textAlign: TextAlign.left,
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: withInkwell
            ? InkWell(
                child: widgetContent,
                onTap: onTap,
                borderRadius: borderRadius,
              )
            : widgetContent,
        shape: rectangleBorder,
        margin: const EdgeInsets.all(5),
        elevation: 5,
      ),
    );
  }
}
