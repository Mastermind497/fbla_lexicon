import 'package:flutter/foundation.dart';

import 'question_foundation.dart';
import 'event.dart';

class AnsweredMultipleChoiceQuestion implements AnsweredQuestion {
  final String _id;
  final AnswerChoice _picked;
  final AnswerChoice _correctAnswer;
  final Event _event;

  const AnsweredMultipleChoiceQuestion({
    @required String id,
    @required AnswerChoice picked,
    @required AnswerChoice correctAnswer,
    @required Event event,
  })  : _id = id,
        _picked = picked,
        _correctAnswer = correctAnswer,
        _event = event;

  String get id => _id;

  AnswerChoice get picked => _picked;

  bool get isCorrect => _picked == _correctAnswer;

  Event get event => _event;
}

class AnsweredDropdownQuestion implements AnsweredQuestion {
  final String _id;
  final AnswerChoice _picked;
  final AnswerChoice _correctAnswer;
  final Event _event;

  const AnsweredDropdownQuestion({
    @required String id,
    @required AnswerChoice picked,
    @required AnswerChoice correctAnswer,
    @required Event event,
  })  : _id = id,
        _picked = picked,
        _correctAnswer = correctAnswer,
        _event = event;

  String get id => _id;

  AnswerChoice get picked => _picked;

  bool get isCorrect => _picked == _correctAnswer;

  Event get event => _event;
}

class AnsweredTrueFalseQuestion implements AnsweredQuestion {
  final String _id;
  final bool _picked;
  final bool _correctAnswer;
  final Event _event;

  const AnsweredTrueFalseQuestion({
    @required String id,
    @required bool picked,
    @required bool correctAnswer,
    @required Event event,
  })  : _id = id,
        _picked = picked,
        _correctAnswer = correctAnswer,
        _event = event;

  String get id => _id;

  bool get picked => _picked;

  bool get isCorrect => _picked == _correctAnswer;

  Event get event => _event;
}

class AnsweredFreeResponseQuestion implements AnsweredQuestion {
  final String _id;
  final String _picked;
  final String _correctAnswer;
  final Event _event;

  const AnsweredFreeResponseQuestion({
    @required String id,
    @required String picked,
    @required String correctAnswer,
    @required Event event,
  })  : _id = id,
        _picked = picked,
        _correctAnswer = correctAnswer,
        _event = event;

  String get id => _id;

  String get picked => _picked;

  bool get isCorrect => _picked == _correctAnswer;

  Event get event => _event;
}
