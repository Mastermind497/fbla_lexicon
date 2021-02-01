import 'dart:math';

import 'package:fbla_lexicon/src/business_logic/models/question_data/answered_questions.dart';
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

  bool get isCorrect => selected != null && selected.isCorrect;

  Event get event => _event;

  List<AnswerChoice> get choices => _choices;

  AnsweredMultipleChoiceQuestion get toAnsweredQuestion {
    return AnsweredMultipleChoiceQuestion(
      id: _id,
      chosen: selected,
      correctAnswer: choices.where((element) => element.isCorrect).first,
      event: _event,
    );
  }
}

class MultipleResponseQuestionData extends QuestionData {
  final String _id;
  final String _question;
  final List<AnswerChoice> _choices;
  final List<AnswerChoice> _correctAnswer;
  final List<AnswerChoice> _chosen;
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
        _chosen = <AnswerChoice>[],
        _event = event {
    _correctAnswer.addAll(_choices.where((element) => element.isCorrect));
  }

  String get id => _id;

  String get question => _question;

  bool get isCorrect {
    if (_chosen != null && _chosen.length == _correctAnswer.length) {
      _chosen.forEach((element) {
        if (!element.isCorrect) return false;
      });
      return true;
    } else
      return false;
  }

  List<AnswerChoice> get choices => _choices;

  List<AnswerChoice> get selected => _chosen;

  Event get event => _event;

  AnsweredMultipleResponseQuestion get toAnsweredQuestion {
    return AnsweredMultipleResponseQuestion(
      id: _id,
      chosen: _chosen,
      correctAnswer: _correctAnswer,
      event: event,
    );
  }

  set selected(List<AnswerChoice> selected) {
    _chosen.clear();
    _chosen.addAll(selected);
  }

  void remove(AnswerChoice selected) =>
      _chosen.removeWhere((element) => element == selected);

  void add(AnswerChoice selected) => _chosen.add(selected);

  void addAllChosen(List<AnswerChoice> selected) => _chosen.addAll(selected);
}

class TrueFalseQuestionData extends QuestionData {
  final String _id;
  final String _question;
  final bool _correctAnswer;
  final Event _event;
  bool chosen;

  TrueFalseQuestionData({
    @required int idNumber,
    @required String question,
    @required bool answer,
    @required Event event,
  })  : _question = question,
        _correctAnswer = answer,
        _id = generateId(event, idNumber),
        _event = event;

  String get id => _id;

  String get question => _question;

  bool get isCorrect => chosen == _correctAnswer;

  Event get event => _event;

  bool get answer => _correctAnswer;

  AnsweredTrueFalseQuestion get toAnsweredQuestion {
    return AnsweredTrueFalseQuestion(
      id: _id,
      chosen: chosen,
      correctAnswer: _correctAnswer,
      event: event,
    );
  }
}

class FreeResponseQuestionData extends QuestionData {
  final String _id;
  final String _question;
  final List<String> _correctAnswer;
  final Event _event;
  String chosen;

  FreeResponseQuestionData({
    @required int idNumber,
    @required String question,
    @required List<String> answer,
    @required Event event,
  })  : _question = question,
        _correctAnswer = answer,
        _id = generateId(event, idNumber),
        _event = event;

  String get id => _id;

  String get question => _question;

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

  List<String> get answer => _correctAnswer;

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

  Event get event => _event;

  AnsweredFreeResponseQuestion get toAnsweredQuestion {
    return AnsweredFreeResponseQuestion(
      id: _id,
      chosen: chosen,
      correctAnswer: _correctAnswer,
      event: event,
    );
  }
}
