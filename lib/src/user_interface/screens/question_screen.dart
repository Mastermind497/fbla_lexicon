import 'package:flutter/material.dart';

import '../../business_logic/models/question.dart';
import '../components/question_widgets.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final List<QuestionWidget> questionWidgetList = [];

  void nextQuestion() {}

  void previousQuestion() {}

  _QuestionScreenState() {
    questionWidgetList
        .addAll(_Questions(nextQuestion, previousQuestion).getQuestions());
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// https://www.fbla-pbl.org/media/accounting_i_online_ref_guide.pdf
class _Questions {
  final void Function() next, previous;

  _Questions(this.next, this.previous);

  List<QuestionWidget> getQuestions() {
    return <QuestionWidget>[
      MultipleChoiceWidget(
        MultipleChoiceQuestionData(
          question:
              'A special journal used to record only cash recept transactions is: ',
          choices: AnswerChoice.of([
            'a purchases journal',
            'a cash receipts journal',
            'a cash journal',
            'a sales journal',
          ], 'a cash receipts journal'),
          id: Event.accountingI.withIdString('MC0001'),
        ),
        1,
        nextQuestion: next,
        previousQuestion: previous,
      ),
    ];
  }
}

extension EventNumber on Event {
  String get id => this.index as String;

  String withIdString(String id) => '${this.id}-$id';
}
