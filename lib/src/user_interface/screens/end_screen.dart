import 'package:fbla_lexicon/src/business_logic/data/data_interacter.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../business_logic/models/question.dart';
import '../../business_logic/models/score.dart';
import '../components/question_widgets/question_review_widget.dart';
import '../theme/style.dart';
import 'tab_screen.dart';

class EndScreen extends StatefulWidget {
  static const route = '/end-screen';

  @override
  _EndScreenState createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  List<QuestionData> _questionDataList;
  Score _score;

  Widget get continueButton {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: createMargin(context),
      padding: createPadding(context),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return correctColor.withOpacity(.5);
              }
              return correctColor;
            },
          ),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
            (_) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              );
            },
          ),
        ),
        child: Text('Continue', style: buttonStyle),
        onPressed: () => returnHome(context),
      ),
    );
  }

  Widget get questionReview {
    List<Widget> list = [];
    for (int i = 0; i < _questionDataList.length; i++) {
      list.add(QuestionReview(_questionDataList[i], i + 1));
    }
    list.add(continueButton);
    list.add(SizedBox(height: 10));
    return ListView(children: list);
  }

  Future<void> updateAnsweredQuestions() async {
    writeAnsweredQuestion(
      _questionDataList
          .map(
            (element) => element.toAnsweredQuestion,
          )
          .toList(
            growable: false,
          ),
    );
  }

  void returnHome(BuildContext context) {
    updateAnsweredQuestions();
    Navigator.of(context).pushNamed(
      TabScreen.route,
    );
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
            ),
          ],
        ),
      ),
    );
  }
}
