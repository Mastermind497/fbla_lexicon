import 'package:flutter/foundation.dart';
import 'package:string_similarity/string_similarity.dart';

import 'question_data/question_foundation.dart';
import 'question_data/event.dart';

export 'question_data/answered_questions.dart';
export 'question_data/question_foundation.dart';
export 'question_data/event.dart';

class MultipleChoiceQuestionData extends QuestionData {
  final String _id;
  final String _question;
  final List<AnswerChoice> _choices;
  final Event _event;
  AnswerChoice selected;

  MultipleChoiceQuestionData({
    @required String id,
    @required String question,
    @required List<AnswerChoice> choices,
    @required Event event,
  })  : _question = question,
        _choices = choices,
        _id = id,
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
    @required String id,
    @required String question,
    @required List<AnswerChoice> choices,
    @required Event event,
  })  : _id = id,
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
    @required String id,
    @required String question,
    @required bool answer,
    @required Event event,
  })  : _question = question,
        _answer = answer,
        _id = id,
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
  final String _answer;
  final Event _event;
  String _chosen;

  FreeResponseQuestionData({
    @required String id,
    @required String question,
    @required String answer,
    @required Event event,
  })  : _question = question,
        _answer = answer,
        _id = id,
        _event = event;

  String get id => _id;

  String get question => _question;

  /// Checks if the answer is acceptable using Dice's coefficient, allowing up to
  /// 25% inaccuracy to account for minor spelling mistakes.
  bool get isCorrect =>
      StringSimilarity.compareTwoStrings(_answer, _chosen) >= 0.75;

  String get answer => _answer;

  Event get event => _event;

  set chosen(String choice) => _chosen = choice;
}
