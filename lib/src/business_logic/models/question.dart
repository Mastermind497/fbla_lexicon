import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:string_similarity/string_similarity.dart';

import '../data/utils.dart';
import 'question_data/event.dart';
import 'question_data/question_foundation.dart';

export 'question_data/answered_questions.dart';
export 'question_data/event.dart';
export 'question_data/question_foundation.dart';

class MultipleChoiceQuestionData extends QuestionData {
  final String _id;
  final String _question;
  final List<AnswerChoice> _choices;
  final Event _event;
  AnswerChoice selected;

  MultipleChoiceQuestionData({
    @required int idNumber,
    @required String question,
    @required List<AnswerChoice> choices,
    @required Event event,
  })  : _question = question,
        _choices = choices,
        _id = generateId(event, idNumber),
        _event = event;

  String get id => _id;

  String get question => _question;

  bool get isCorrect => selected.isCorrect;

  Event get event => _event;

  List<AnswerChoice> get choices => _choices;
}

class MultipleResponseQuestionData extends QuestionData {
  final String _id;
  final String _question;
  final List<AnswerChoice> _choices;
  final List<AnswerChoice> _correctAnswer;
  final List<AnswerChoice> _selected;
  final Event _event;

  MultipleResponseQuestionData({
    @required int idNumber,
    @required String question,
    @required List<AnswerChoice> choices,
    @required Event event,
  })  : _id = generateId(event, idNumber),
        _question = question,
        _choices = choices,
        _correctAnswer = <AnswerChoice>[],
        _selected = <AnswerChoice>[],
        _event = event {
    _correctAnswer.addAll(_choices.where((element) => element.isCorrect));
  }

  String get id => _id;

  String get question => _question;

  bool get isCorrect {
    if (_choices.length == _correctAnswer.length) {
      _selected.forEach((element) {
        if (!element.isCorrect) return false;
      });
      return true;
    } else
      return false;
  }

  List<AnswerChoice> get choices => _choices;

  List<AnswerChoice> get selected => _selected;

  Event get event => _event;

  set selected(List<AnswerChoice> selected) {
    _selected.clear();
    _selected.addAll(selected);
  }

  void remove(AnswerChoice selected) =>
      _selected.removeWhere((element) => element == selected);

  void add(AnswerChoice selected) => _selected.add(selected);

  void addAllChosen(List<AnswerChoice> selected) => _selected.addAll(selected);
}

class TrueFalseQuestionData extends QuestionData {
  final String _id;
  final String _question;
  final bool _answer;
  final Event _event;
  bool chosen;

  TrueFalseQuestionData({
    @required int idNumber,
    @required String question,
    @required bool answer,
    @required Event event,
  })  : _question = question,
        _answer = answer,
        _id = generateId(event, idNumber),
        _event = event;

  String get id => _id;

  String get question => _question;

  bool get isCorrect => chosen == _answer;

  Event get event => _event;

  bool get answer => _answer;
}

class FreeResponseQuestionData extends QuestionData {
  final String _id;
  final String _question;
  final List<String> _answer;
  final Event _event;
  String chosen;

  FreeResponseQuestionData({
    @required int idNumber,
    @required String question,
    @required List<String> answer,
    @required Event event,
  })  : _question = question,
        _answer = answer,
        _id = generateId(event, idNumber),
        _event = event;

  String get id => _id;

  String get question => _question;

  /// Checks if the answer is acceptable using Dice's coefficient, allowing up to
  /// 25% inaccuracy to account for minor spelling mistakes.
  bool get isCorrect {
    double similarity = 0;
    if (chosen == null) return false;
    _answer.forEach(
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

  List<String> get answer => _answer;

  String get answerRepresentation {
    String toReturn = _answer[0];
    if (_answer.length > 1) {
      toReturn += ' Also Accepts: ';
      for (int i = 1; i < _answer.length; i++) {
        toReturn += '$_answer[i]' + (i + 1 == _answer.length ? '' : ', ');
      }
    }
    return toReturn;
  }

  Event get event => _event;
}
