import 'package:fbla_lexicon/src/user_interface/components/question_score.dart';

import '../theme/style.dart';
import 'package:flutter/material.dart';

import '../../business_logic/data/data_interacter.dart';
import '../../business_logic/models/question.dart';
import '../components/question_widgets/question_review_widget.dart';

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  List<QuestionData> questionList = [];

  Future<List<QuestionData>> updateAnsweredQuestions() async {
    questionList = (await answeredQuestionData)
        .map((element) => AnsweredQuestion.fromFileString(element))
        .toList()
          ..removeWhere((element) => element == null);
    return questionList;
  }

  Widget get emptyQuestionNotification {
    return Center(
      child: Expanded(
        child: Text('No Questions Yet', style: bigGreyText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<QuestionData>>(
      future: updateAnsweredQuestions(),
      builder: (context, AsyncSnapshot<List<QuestionData>> snapshot) {
        if (snapshot.hasData) {
          return (snapshot.data.length > 0
              ? Column(
                  children: [
                    QuestionScore(Score(snapshot.data.toAnsweredQuestionList)),
                    ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return QuestionReview(
                          snapshot.data[index],
                          index + 1,
                          true,
                          () => {},
                        );
                      },
                    ),
                  ],
                )
              : Container(
                  child: Text('No Questions Yet'),
                ));
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
