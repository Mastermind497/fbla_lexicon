import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:string_similarity/string_similarity.dart';

import 'event.dart';
import 'question_foundation.dart';

class AnsweredMultipleChoiceQuestion implements AnsweredQuestion {
  final String _id;
  final AnswerChoice _selected;
  final AnswerChoice _correctAnswer;
  final Event _event;

  const AnsweredMultipleChoiceQuestion({
    @required String id,
    @required AnswerChoice selected,
    @required AnswerChoice correctAnswer,
    @required Event event,
  })  : _id = id,
        _selected = selected,
        _correctAnswer = correctAnswer,
        _event = event;

  String get id => _id;

  AnswerChoice get selected => _selected;

  bool get isCorrect => _selected == _correctAnswer;

  Event get event => _event;

  String get toFileString => '$_id | ${_selected.id ?? ''}';

  List<Object> get props => [id];

  bool get stringify => false;
}

class AnsweredMultipleResponseQuestion implements AnsweredQuestion {
  final String _id;
  final List<AnswerChoice> _selected;
  final List<AnswerChoice> _correctAnswer;
  final Event _event;

  const AnsweredMultipleResponseQuestion({
    @required String id,
    @required List<AnswerChoice> selected,
    @required List<AnswerChoice> correctAnswer,
    @required Event event,
  })  : _id = id,
        _selected = selected,
        _correctAnswer = correctAnswer,
        _event = event;

  String get id => _id;

  List<AnswerChoice> get selected => _selected;

  bool get isCorrect {
    if (_selected != null && _selected.length == _correctAnswer.length) {
      _selected.forEach((element) {
        if (!element.isCorrect) return false;
      });
      return true;
    } else
      return false;
  }

  Event get event => _event;

  String get toFileString {
    String output = '$_id | ';
    if (selected != null) {
      final addDataInitial = _selected.map((element) => element.id).toString();
      final addData = addDataInitial.substring(1, addDataInitial.length);
      output += addData;
    }
    return output;
  }

  List<Object> get props => [id];

  bool get stringify => false;
}

class AnsweredTrueFalseQuestion implements AnsweredQuestion {
  final String _id;
  final bool _selected;
  final bool _correctAnswer;
  final Event _event;

  const AnsweredTrueFalseQuestion({
    @required String id,
    @required bool selected,
    @required bool correctAnswer,
    @required Event event,
  })  : _id = id,
        _selected = selected,
        _correctAnswer = correctAnswer,
        _event = event;

  String get id => _id;

  bool get selected => _selected;

  bool get isCorrect => _selected == _correctAnswer;

  Event get event => _event;

  String get toFileString => '$_id | ${_selected ?? ''}';

  List<Object> get props => [id];

  bool get stringify => false;
}

class AnsweredFreeResponseQuestion implements AnsweredQuestion {
  final String _id;
  final String _selected = '';
  final List<String> _correctAnswer;
  final Event _event;

  const AnsweredFreeResponseQuestion({
    @required String id,
    @required String selected,
    @required List<String> correctAnswer,
    @required Event event,
  })  : _id = id,
        _selected = selected,
        _correctAnswer = correctAnswer,
        _event = event;

  String get id => _id;

  String get selected => _selected;

  List<String> get answer => _correctAnswer;

  Event get event => _event;

  /// Checks if the answer is acceptable using Dice's coefficient, allowing up to
  /// 25% inaccuracy to account for minor spelling mistakes.
  bool get isCorrect {
    double similarity = 0;
    if (selected == null) return false;
    _correctAnswer.forEach(
      (element) {
        similarity = max(
          similarity,
          StringSimilarity.compareTwoStrings(
            element.toUpperCase(),
            selected.toUpperCase(),
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

  String get toFileString => '$_id | ${_selected ?? ''}';

  List<Object> get props => [id];

  bool get stringify => false;
}
