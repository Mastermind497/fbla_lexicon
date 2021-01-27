import 'package:flutter/material.dart';

import '../../business_logic/data/question_list.dart';
import '../components/question_widgets.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final List<Widget> questionWidgetList = [];
  final int numQuestions;

  int currentQuestion = 0;
  bool ended = false;

  void nextQuestion() {
    setState(() {
      currentQuestion++;
      ended = currentQuestion == questionWidgetList.length;
    });
  }

  void previousQuestion() {
    setState(() {
      currentQuestion--;
    });
  }

  _QuestionScreenState([this.numQuestions = 5]) {
    var questionList = randomQuestions(numQuestions);
    for (int i = 0; i < numQuestions; i++) {
      questionWidgetList.add(
        QuestionWidget.getQuestionWidget(
          questionList[i],
          i + 1,
          nextQuestion,
          (i == 0 ? null : previousQuestion),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int score = 0;
    questionWidgetList.forEach((element) {
      var data = QuestionWidget.getQuestionDataFrom(element);
      if (data.isCorrect) score++;
    });
    return Container(
      child: ended
          ? Text(
              'Ended: Score: $score / $numQuestions = ${score / numQuestions * 100}%',
            )
          : questionWidgetList[currentQuestion],
    );
  }
}
