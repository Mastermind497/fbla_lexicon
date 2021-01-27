import 'package:flutter/material.dart';

import '../../business_logic/models/question.dart';
import '../../business_logic/data/question_list.dart';
import '../components/question_widgets.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final List<Widget> questionWidgetList = [];

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

  _QuestionScreenState() {
    var questionList = randomQuestions();
    for (int i = 0; i < questionList.length; i++) {
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
    return Container(
      child: ended ? Text('Ended') : questionWidgetList[currentQuestion],
    );
  }
}
