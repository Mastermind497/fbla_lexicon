import 'package:fbla_lexicon/src/user_interface/screens/end_screen.dart';
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

  void goToEndScreen(BuildContext context) {
    Navigator.of(context).pushNamed(EndScreen.route, arguments: {
      'questionList': questionWidgetList.toQuestionDataList,
    });
  }

  void nextQuestion(BuildContext context) {
    if (currentQuestion + 1 == numQuestions)
      goToEndScreen(context);
    else
      setState(() {
        currentQuestion++;
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
            () => nextQuestion(context),
            (i == 0 ? null : previousQuestion),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        child: questionWidgetList[currentQuestion],
      ),
    );
  }
}
