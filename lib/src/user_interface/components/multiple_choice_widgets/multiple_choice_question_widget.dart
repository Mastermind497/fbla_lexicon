import 'package:flutter/material.dart';

import '../../../user_interface/theme/style.dart';
import '../../../business_logic/models/question.dart';
import 'multiple_choice_answer_choices_widget.dart';

class MultipleChoiceQuestionWidget extends StatelessWidget {
  final MultipleChoiceQuestionData data;
  final int questionNumber;

  static const double spaceMultiplier = 0.01;
  static const double questionSize = 0.3;

  static final BorderRadius br = BorderRadius.circular(15);

  static EdgeInsets padding = EdgeInsets.all(10);

  MultipleChoiceQuestionWidget(this.data, this.questionNumber);

  Widget _generateQuestion(BuildContext context, EdgeInsets padding) {
    final MediaQueryData mq = MediaQuery.of(context);
    return Container(
      padding: padding,
      height: mq.size.height * 0.3,
      width: mq.size.width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: br),
        child: Column(
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);
    padding = EdgeInsets.symmetric(
      horizontal: mq.size.width * spaceMultiplier,
      vertical: mq.size.height * spaceMultiplier / 10,
    );

    return Container(
      child: Column(
        children: [
          _generateQuestion(context, padding),
          MultipleChoiceAnswerChoicesWidget(data.choices),
        ],
      ),
    );
  }
}
