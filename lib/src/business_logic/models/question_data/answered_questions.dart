import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:string_similarity/string_similarity.dart';

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
  final List<String> _correctAnswer;
  final Event _event;

  const AnsweredFreeResponseQuestion({
    @required String id,
    @required String chosen,
    @required List<String> correctAnswer,
    @required Event event,
  })  : _id = id,
        _chosen = chosen,
        _correctAnswer = correctAnswer,
        _event = event;

  String get id => _id;

  String get chosen => _chosen;

  List<String> get answer => _correctAnswer;

  Event get event => _event;

  /// Checks if the answer is acceptable using Dice's coefficient, allowing up to
  /// 25% inaccuracy to account for minor spelling mistakes.
  bool get isCorrect {
    double similarity = 0;
    if (chosen == null) return false;
    _correctAnswer.forEach(
      (element) {
        similarity = max(
          similarity,
          StringSimilarity.compareTwoStrings(
            element.toUpperCase(),
            chosen.toUpperCase(),
          ),
        );
      },
    );

    return similarity >= 0.75;
  }

  String get answerRepresentation {
    String toReturn = _correctAnswer[0];
    if (_correctAnswer.length > 1) {
      toReturn += ' Also Accepts: ';
      for (int i = 1; i < _correctAnswer.length; i++) {
        toReturn +=
            '$_correctAnswer[i]' + (i + 1 == _correctAnswer.length ? '' : ', ');
      }
    }
    return toReturn;
  }
}
