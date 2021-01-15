import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

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
}
