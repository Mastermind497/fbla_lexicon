import 'package:flutter/foundation.dart';

import 'package:string_similarity/string_similarity.dart';

import 'question_data/question_foundation.dart';
export 'question_data/answered_questions.dart';
export 'question_data/question_foundation.dart';

class MultipleChoiceQuestionData extends QuestionData {
  final String _id;
  final String _question;
  final List<AnswerChoice> _choices;
  AnswerChoice selected;

  MultipleChoiceQuestionData({
    @required id,
    @required question,
    @required choices,
  })  : _question = question,
        _choices = choices,
        _id = id;

  @override
  String get id => _id;

  @override
  String get question => _question;

  @override
  bool get isCorrect => selected.isCorrect;

  List<AnswerChoice> get choices => _choices;
}

class MultipleResponseQuestionData extends QuestionData {
  final String _id;
  final String _question;
  final List<AnswerChoice> _choices;
  final List<AnswerChoice> _correctAnswer;
  final List<AnswerChoice> _selected;

  MultipleResponseQuestionData(String id, String question, List<AnswerChoice> choices)
      : this._id = id,
        this._question = question,
        this._choices = choices,
        this._correctAnswer = [],
        this._selected = [] {
    _correctAnswer.addAll(_choices.where((element) => element.isCorrect));
  }

  @override
  String get id => _id;

  @override
  String get question => _question;

  @override
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

  set selected(List<AnswerChoice> selected) {
    _selected.clear();
    _selected.addAll(selected);
  }

  void addChosen(AnswerChoice selected) => _selected.add(selected);

  void addAllChosen(List<AnswerChoice> selected) => _selected.addAll(selected);
}

class TrueFalseQuestionData extends QuestionData {
  final String _id;
  final String _question;
  final bool _answer;
  bool chosen;

  TrueFalseQuestionData({
    @required id,
    @required question,
    @required answer,
  })  : _question = question,
        _answer = answer,
        _id = id;

  @override
  String get id => _id;

  @override
  String get question => _question;

  @override
  bool get isCorrect => chosen == _answer;

  bool get answer => _answer;
}

class FillInTheBlankQuestionData extends QuestionData {
  final String _id;
  final String _question;
  final String _answer;
  String _chosen;

  FillInTheBlankQuestionData({
    @required String id,
    @required String question,
    @required String answer,
  })  : _question = question,
        _answer = answer,
        _id = id;

  @override
  String get id => _id;

  @override
  String get question => _question;

  /// Checks if the answer is acceptable using Dice's coefficient, allowing up to
  /// 25% inaccuracy to account for minor spelling mistakes.
  @override
  bool get isCorrect => _chosen.similarityTo(_answer) >= 0.75;

  String get answer => _answer;

  set chosen(String choice) => _chosen;
}
