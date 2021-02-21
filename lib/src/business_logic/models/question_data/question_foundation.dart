import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../data/utils.dart';
import '../score.dart';
import 'event.dart';

abstract class RawQuestionData {
  String get id;
  Event get event;

  const RawQuestionData();
}

abstract class AnsweredQuestion extends RawQuestionData {
  String get id;
  bool get isCorrect;
  Event get event;

  const AnsweredQuestion();
}

abstract class QuestionData extends RawQuestionData {
  String get id;
  String get question;
  bool get isCorrect;
  Event get event;
  AnsweredQuestion get toAnsweredQuestion;
  String get getSelected;
  String get correctAnswer;

  const QuestionData();
}

extension ListExtension on List<QuestionData> {
  int get getNumCorrect {
    int total = 0;
    this.forEach((element) {
      if (element.isCorrect) total++;
    });
    return total;
  }

  Score get getScore => Score(this);
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
