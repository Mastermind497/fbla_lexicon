import 'package:flutter/material.dart';

import 'src/business_logic/models/question.dart';
import 'src/user_interface/components/question_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var question = MultipleChoiceQuestionData(
    id: 'id',
    question: 'What is the best fruit',
    choices: [
      AnswerChoice(
          'Apple asdfasdfasdfasfdasaaaazfafasdfasdfsa asfaasasfasfasdfadfajfkaskfj asdfsfdkadfsasdf',
          id: '0'),
      AnswerChoice('Orange', id: '1'),
      AnswerChoice('Pear', id: '2'),
      AnswerChoice('Coconut', id: '3'),
    ],
  );

  var questionWidget;

  _MyHomePageState() {
    questionWidget = MultipleChoiceWidget(question, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: Center(
        child: questionWidget,
      ),
    );
  }
}
