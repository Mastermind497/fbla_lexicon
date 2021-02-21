import 'package:flutter/material.dart';

import '../../business_logic/models/question.dart';
import '../../business_logic/models/score.dart';
import 'question_widgets/free_response_widget.dart';
import 'question_widgets/multiple_choice_widget.dart';
import 'question_widgets/multiple_response_widget.dart';
import 'question_widgets/true_false_widget.dart';

export 'question_widgets/free_response_widget.dart';
export 'question_widgets/multiple_choice_widget.dart';
export 'question_widgets/multiple_response_widget.dart';
export 'question_widgets/true_false_widget.dart';

abstract class QuestionWidget {
  QuestionData get data;

  static Widget getQuestionWidget(QuestionData data, int questionNumber,
      void Function() nextQuestion, void Function() previousQuestion) {
    if (data is MultipleChoiceQuestionData) {
      return MultipleChoiceWidget(
        data,
        questionNumber,
        nextQuestion: nextQuestion,
        previousQuestion: previousQuestion,
      );
    } else if (data is MultipleResponseQuestionData) {
      return MultipleResponseWidget(
        data,
        questionNumber,
        nextQuestion: nextQuestion,
        previousQuestion: previousQuestion,
      );
    } else if (data is TrueFalseQuestionData) {
      return TrueFalseWidget(
        data,
        questionNumber,
        nextQuestion: nextQuestion,
        previousQuestion: previousQuestion,
      );
    } else {
      return FreeResponseWidget(
        data,
        questionNumber,
        nextQuestion: nextQuestion,
        previousQuestion: previousQuestion,
      );
    }
  }

  static QuestionData getQuestionDataFrom(Widget widget) {
    if (!(widget is QuestionWidget))
      return null;
    else
      return (widget as QuestionWidget).data;
  }
}

extension QuestionWidgetListExtension on List<Widget> {
  List<QuestionData> get toQuestionDataList {
    List<QuestionData> list = [];
    this.forEach(
      (element) => list.add(QuestionWidget.getQuestionDataFrom(element)),
    );
    return list;
  }

  int get getNumCorrect => this.toQuestionDataList.getNumCorrect;

  Score get getScore => this.toQuestionDataList.getScore;
}
