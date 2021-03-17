import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../data/question_list.dart';
import '../../data/utils.dart';
import '../question.dart';
import '../score.dart';
import 'event.dart';

abstract class RawQuestionData {
  String get id;
  Event get event;

  const RawQuestionData();
}

abstract class AnsweredQuestion extends RawQuestionData with EquatableMixin {
  String get id;
  bool get isCorrect;
  Event get event;
  String get toFileString;

  List<Object> get props => [id];

  bool get stringify => false;

  const AnsweredQuestion();
  static QuestionData fromFileString(String fileString) {
    if (fileString == '') return null;
    final parts = fileString.split(' | ');
    final data = questionList.firstWhere((element) => element.id == parts[0]);

    if (data is MultipleChoiceQuestionData) {
      if (parts[1] == '' || parts[1].contains('answer'))
        data.selected = null;
      else
        data.selected = data.choices
            .firstWhere((element) => element.id.toString() == parts[1]);
    } else if (data is MultipleResponseQuestionData) {
      if (parts[1] == '' || parts[1].contains('answer'))
        data.selected = [];
      else
        data.selected = parts[1]
            .split(', ')
            .map((element) =>
                data.choices.firstWhere(
                    (choice) => (choice.id.toString() == element)) ??
                data.choices[1])
            .toList();
    } else if (data is TrueFalseQuestionData) {
      data.selected = (parts[1] == '' || parts[1].contains('answer')
          ? null
          : parts[1] == 'true');
    } else if (data is FreeResponseQuestionData) {
      data.selected = parts[1];
    }

    return data;
  }
}

extension AnsweredQuestionList on List<AnsweredQuestion> {
  int get getNumCorrect {
    int total = 0;
    this.forEach((element) {
      if (element.isCorrect) total++;
    });
    return total;
  }

  Score get score => Score(this);
}

abstract class QuestionData extends RawQuestionData {
  String get id;
  String get question;
  bool get isCorrect;
  Event get event;
  AnsweredQuestion get toAnsweredQuestion;
  String get getSelected;
  String get correctAnswer;

  void reset();

  const QuestionData();
}

extension QuestionDataList on List<QuestionData> {
  int get getNumCorrect {
    int total = 0;
    this.forEach((element) {
      if (element.isCorrect) total++;
    });
    return total;
  }

  List<AnsweredQuestion> get toAnsweredQuestionList => (this.length > 0
      ? this.map((QuestionData element) => element.toAnsweredQuestion).toList()
      : []);

  Score get getScore => Score(this.toAnsweredQuestionList);
}

class AnswerChoice extends Equatable {
  final String _id;
  final String _content;
  final bool _isCorrect;

  const AnswerChoice(
    this._content, {
    bool isCorrect = false,
    @required String id,
  })  : this._id = id,
        this._isCorrect = isCorrect;

  @override
  List<Object> get props => [_id];

  String get content => _content;

  bool get isCorrect => _isCorrect;

  String get id => _id;

  @override
  String toString() {
    return '$id (' + (isCorrect ? 'YES' : 'NO') + '): $content';
  }

  static List<AnswerChoice> of(List<String> choices, String correct) {
    final List<AnswerChoice> answerChoices = [];
    int id = 0;
    if (choices.contains(correct)) {
      choices.remove(correct);
    }
    answerChoices.add(
      AnswerChoice(correct, isCorrect: true, id: '${id++}'),
    );
    choices.forEach(
      (element) => answerChoices.add(
        AnswerChoice(
          element,
          id: '${id++}',
        ),
      ),
    );
    shuffle(answerChoices);
    return answerChoices;
  }

  static List<AnswerChoice> ofMultiple(
    List<String> choices,
    List<String> correct,
  ) {
    final List<AnswerChoice> answerChoices = [];
    int id = 0;
    choices.removeWhere((element) => correct.contains(element));
    correct.forEach(
      (correctElement) {
        answerChoices.add(
          AnswerChoice(
            correctElement,
            isCorrect: true,
            id: '${id++}',
          ),
        );
      },
    );
    choices.forEach(
      (element) => answerChoices.add(
        AnswerChoice(
          element,
          id: '${id++}',
        ),
      ),
    );
    shuffle(answerChoices);
    return answerChoices;
  }
}

extension AnswerChoiceList on List<AnswerChoice> {
  AnswerChoice get correct {
    AnswerChoice correct;
    this.forEach(
      (element) {
        if (element.isCorrect) correct = element;
      },
    );
    return correct;
  }
}
