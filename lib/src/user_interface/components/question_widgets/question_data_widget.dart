import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../business_logic/models/question.dart';
import '../../../user_interface/theme/style.dart';

class QuestionDataWidget extends StatelessWidget {
  final QuestionData data;
  final int questionNumber;
  final Function previous, next;
  final double size;

  const QuestionDataWidget(
    this.data,
    this.questionNumber, {
    this.previous,
    this.next,
    this.size = 0.3,
  });

  Widget _generateQuestion(BuildContext context) {
    final size = MediaQuery.of(context).size;

    EdgeInsets padding = createPadding(context);

    return Container(
      padding: padding,
      height: size.height * this.size,
      width: size.width,
      child: Card(
        shape: rectangleBorder,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: previous,
              color: Theme.of(context).primaryColor,
              splashRadius: Material.defaultSplashRadius - 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (questionNumber != null)
                  Text(
                    'Question $questionNumber',
                    style: questionStyleA,
                  ),
                if (questionNumber != null)
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height * spaceMultiplier,
                  ),
                Container(
                  width: size.width * 2 / 3,
                  child: AutoSizeText(
                    data.question,
                    style: questionStyleB,
                    maxLines: (data is TrueFalseQuestionData ? 6 : 4),
                    maxFontSize: 26,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios_rounded),
              onPressed: next,
              color: Theme.of(context).primaryColor,
              splashRadius: Material.defaultSplashRadius - 10,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _generateQuestion(context),
    );
  }
}
