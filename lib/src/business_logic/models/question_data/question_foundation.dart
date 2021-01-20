import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../data/utils.dart';

abstract class RawQuestionData {
  String get id;
}

abstract class AnsweredQuestion implements RawQuestionData {
  String get id;
  bool get isCorrect;
}

abstract class QuestionData implements RawQuestionData {
  String get id;
  String get question;
  bool get isCorrect;

  const QuestionData();
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
}
