import 'package:flutter/material.dart';

import '../../business_logic/data/question_list.dart';
import '../components/question_widgets.dart';

class QuestionScreen extends StatefulWidget {
  static const route = '/question-screen';
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final List<Widget> questionWidgetList = [];
  int numQuestions;
  String title;

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

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    numQuestions = (routeArgs['numQuestions'] ?? '5') as int;
    title = routeArgs['title'];

    if (questionWidgetList.isEmpty) {
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

    int score = 0;
    questionWidgetList.forEach((element) {
      var data = QuestionWidget.getQuestionDataFrom(element);
      if (data.isCorrect) score++;
    });
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        child: ended
            ? Text(
                'Ended: Score: $score / $numQuestions = ${score / numQuestions * 100}%',
              )
            : questionWidgetList[currentQuestion],
      ),
    );
  }
}
