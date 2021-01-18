import 'package:flutter/material.dart';

import '../../../business_logic/models/question.dart';
import '../../../user_interface/theme/style.dart';

class QuestionDataWidget extends StatelessWidget {
  final QuestionData data;
  final int questionNumber;
  final Function previous, next;

  QuestionDataWidget(
    this.data,
    this.questionNumber, {
    this.previous,
    this.next,
  });

  Widget _generateQuestion(BuildContext context) {
    final size = MediaQuery.of(context).size;

    EdgeInsets padding = createPadding(context);

    return Container(
      padding: padding,
      height: size.height * 0.3,
      width: size.width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
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
              children: [
                if (questionNumber != null)
                  Text(
                    "Question $questionNumber",
                    style: questionStyleA,
                  ),
                if (questionNumber != null)
                  SizedBox(
                    height: MediaQuery.of(context).size.height * spaceMultiplier,
                  ),
                Text(data.question, style: questionStyleB),
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
