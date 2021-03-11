import 'package:fbla_lexicon/src/business_logic/models/question.dart';
import 'package:fbla_lexicon/src/user_interface/components/question_widgets/question_review_widget.dart';
import 'package:flutter/material.dart';
import 'package:fbla_lexicon/src/business_logic/data/data_interacter.dart';

class ReviewScreen extends StatelessWidget {
  List<QuestionData> questionList;
  void updateAnsweredQuestions() async {
    questionList = (await answeredQuestionData)
        .map((element) => AnsweredQuestion.fromFileString(element))
        .toList();
  }

  ReviewScreen() {
    updateAnsweredQuestions();
  }

  @override
  Widget build(BuildContext context) {
    updateAnsweredQuestions();
    return Scaffold(
      appBar: AppBar(
        title: Text('Question Review'),
      ),
      body: ListView.builder(
        itemCount: questionList.length,
        itemBuilder: (BuildContext context, int index) {
          return QuestionReview(questionList[index], index + 1);
        },
      ),
    );
  }
}
