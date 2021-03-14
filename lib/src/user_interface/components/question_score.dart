import 'package:fbla_lexicon/src/user_interface/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../business_logic/models/score.dart';
export '../../business_logic/models/score.dart';

class QuestionScore extends StatelessWidget {
  const QuestionScore(Score score, {Key key})
      : _score = score,
        super(key: key);

  final Score _score;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${_score.getCorrectPercent}',
            style: endScore,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 50,
              lineHeight: 30.0,
              percent: _score.getCorrectPercent.asDouble,
              animation: true,
              progressColor: correctColor,
              backgroundColor: incorrectColor,
            ),
          ),
        ],
      ),
    );
  }
}
