import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:string_similarity/string_similarity.dart';

import '../data/utils.dart';
import 'question_data/answered_questions.dart';
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
  AnswerChoice _correctAnswer;
  AnswerChoice selected;

  MultipleChoiceQuestionData({
    @required int idNumber,
    @required String question,
    @required List<AnswerChoice> choices,
    @required Event event,
  })  : _question = question,
        _choices = choices,
        _id = generateId(event, idNumber),
        _event = event {
    _correctAnswer = _choices.correct;
  }

  String get id => _id;

  String get question => _question;

  bool get isCorrect => selected != null && selected.isCorrect;

  Event get event => _event;

  List<AnswerChoice> get choices => _choices;

  String get getSelected => selected.content;

  String get correctAnswer => _correctAnswer.content;

  AnsweredMultipleChoiceQuestion get toAnsweredQuestion {
    return AnsweredMultipleChoiceQuestion(
      id: _id,
      selected: selected,
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
    if (_selected != null && _selected.length == _correctAnswer.length) {
      _selected.forEach((element) {
        if (!element.isCorrect) return false;
      });
      return true;
    } else
      return false;
  }

  List<AnswerChoice> get choices => _choices;

  List<AnswerChoice> get selected => _selected;

  String get getSelected {
    String s = '';
    for (int i = 0; i < selected.length; i++) {
      if (i == selected.length - 1) s += 'and ${selected[i]}';
    }
    return s;
  }

  String get correctAnswer {
    String s = '';
    for (int i = 0; i < _correctAnswer.length; i++) {
      if (i == _correctAnswer.length - 1) s += 'and ${_correctAnswer[i]}';
    }
    return s;
  }

  Event get event => _event;

  AnsweredMultipleResponseQuestion get toAnsweredQuestion {
    return AnsweredMultipleResponseQuestion(
      id: _id,
      selected: _selected,
      correctAnswer: _correctAnswer,
      event: event,
    );
  }

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
  final bool _correctAnswer;
  final Event _event;
  bool selected;

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

  bool get isCorrect => selected == _correctAnswer;

  Event get event => _event;

  bool get answer => _correctAnswer;

  String get getSelected => selected ? 'True' : 'False';

  String get correctAnswer => answer ? 'True' : 'False';

  AnsweredTrueFalseQuestion get toAnsweredQuestion {
    return AnsweredTrueFalseQuestion(
      id: _id,
      selected: selected,
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
  String selected;

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

  String get getSelected => selected;

  String get correctAnswer => answerRepresentation;

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

  List<String> get answer => _correctAnswer;

  String get answerRepresentation {
    String toReturn = _correctAnswer[0];
    if (_correctAnswer.length > 1) {
      toReturn += '. Also Accepts: ';
      for (int i = 1; i < _correctAnswer.length; i++) {
        toReturn += '${_correctAnswer[i]}' +
            (i + 1 == _correctAnswer.length ? '' : ', ');
      }
    }
    return toReturn;
  }

  Event get event => _event;

  AnsweredFreeResponseQuestion get toAnsweredQuestion {
    return AnsweredFreeResponseQuestion(
      id: _id,
      selected: selected,
      correctAnswer: _correctAnswer,
      event: event,
    );
  }
}

extension QuestionDataList on List<QuestionData> {
  List<AnsweredQuestion> get toAnsweredQuestionList =>
      this.map((QuestionData element) => element.toAnsweredQuestion).toList();
}
