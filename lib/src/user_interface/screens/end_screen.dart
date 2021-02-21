import 'package:fbla_lexicon/src/user_interface/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../business_logic/models/question.dart';
import '../../business_logic/models/score.dart';

class EndScreen extends StatefulWidget {
  static const route = '/end-screen';

  @override
  _EndScreenState createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  List<QuestionData> _questionDataList;
  Score _score;

  Widget get questionReview {
    List<Widget> list = [];
    for (int i = 0; i < _questionDataList.length; i++) {
      list.add(QuestionReview(_questionDataList[i], i + 1));
    }
    return ListView(children: list);
  }

  @override
  Widget build(BuildContext context) {
    if (_questionDataList == null) {
      final routeArgs = ModalRoute.of(context).settings.arguments as Map;
      _questionDataList = routeArgs['questionList'];
      _score = Score(_questionDataList);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('End Screen'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
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
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.660996,
              child: questionReview,
            )
          ],
        ),
      ),
    );
  }
}

class QuestionReview extends StatelessWidget {
  final QuestionData _questionData;
  final int _questionNumber;
  final TextStyle headingStyle, bodyStyle;

  QuestionReview(this._questionData, [this._questionNumber])
      : headingStyle = _questionData.isCorrect
            ? selectionHeadingCorrect
            : selectionHeadingIncorrect,
        bodyStyle = _questionData.isCorrect
            ? selectionBodyCorrect
            : selectionBodyIncorrect;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
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
        ),
        shape: rectangleBorder,
        margin: const EdgeInsets.all(5),
        elevation: 10,
      ),
    );
  }
}