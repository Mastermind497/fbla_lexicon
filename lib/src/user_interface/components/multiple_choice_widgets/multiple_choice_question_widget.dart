import 'package:flutter/material.dart';

import '../../../user_interface/theme/style.dart';
import '../../../business_logic/models/question.dart';

class MultipleChoiceQuestionWidget extends StatelessWidget {
  final MultipleChoiceQuestionData data;
  final int questionNumber;
  final Function previous, next;

  MultipleChoiceQuestionWidget(this.data, this.questionNumber, {this.previous, this.next});

  Widget _generateQuestion(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);

    EdgeInsets padding = createPadding(context);

    return Container(
      padding: padding,
      height: mq.size.height * 0.3,
      width: mq.size.width,
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
