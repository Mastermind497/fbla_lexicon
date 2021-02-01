import 'package:flutter/foundation.dart';

import 'event.dart';
import 'question_foundation.dart';

class AnsweredMultipleChoiceQuestion implements AnsweredQuestion {
  final String _id;
  final AnswerChoice _chosen;
  final AnswerChoice _correctAnswer;
  final Event _event;

  const AnsweredMultipleChoiceQuestion({
    @required String id,
    @required AnswerChoice chosen,
    @required AnswerChoice correctAnswer,
    @required Event event,
  })  : _id = id,
        _chosen = chosen,
        _correctAnswer = correctAnswer,
        _event = event;

  String get id => _id;

  AnswerChoice get chosen => _chosen;

  bool get isCorrect => _chosen == _correctAnswer;

  Event get event => _event;
}

class AnsweredMultipleResponseQuestion implements AnsweredQuestion {
  final String _id;
  final List<AnswerChoice> _chosen;
  final List<AnswerChoice> _correctAnswer;
  final Event _event;

  const AnsweredMultipleResponseQuestion({
    @required String id,
    @required List<AnswerChoice> chosen,
    @required List<AnswerChoice> correctAnswer,
    @required Event event,
  })  : _id = id,
        _chosen = chosen,
        _correctAnswer = correctAnswer,
        _event = event;

  String get id => _id;

  List<AnswerChoice> get chosen => _chosen;

  bool get isCorrect {
    if (_chosen != null && _chosen.length == _correctAnswer.length) {
      _chosen.forEach((element) {
        if (!element.isCorrect) return false;
      });
      return true;
    } else
      return false;
  }

  Event get event => _event;
}

class AnsweredTrueFalseQuestion implements AnsweredQuestion {
  final String _id;
  final bool _chosen;
  final bool _correctAnswer;
  final Event _event;

  const AnsweredTrueFalseQuestion({
    @required String id,
    @required bool chosen,
    @required bool correctAnswer,
    @required Event event,
  })  : _id = id,
        _chosen = chosen,
        _correctAnswer = correctAnswer,
        _event = event;

  String get id => _id;

  bool get chosen => _chosen;

  bool get isCorrect => _chosen == _correctAnswer;

  Event get event => _event;
}

class AnsweredFreeResponseQuestion implements AnsweredQuestion {
  final String _id;
  final String _chosen;
  final String _correctAnswer;
  final Event _event;

  const AnsweredFreeResponseQuestion({
    @required String id,
    @required String chosen,
    @required String correctAnswer,
    @required Event event,
  })  : _id = id,
        _chosen = chosen,
        _correctAnswer = correctAnswer,
        _event = event;

  String get id => _id;

  String get chosen => _chosen;

  bool get isCorrect => _chosen == _correctAnswer;

  Event get event => _event;
}
