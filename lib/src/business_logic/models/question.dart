import 'package:flutter/foundation.dart';

import 'question_data/question_foundation.dart';
export 'question_data/answered_questions.dart';
export 'question_data/question_foundation.dart';

class MultipleChoiceQuestionData extends QuestionData {
  final String _id;
  final String _question;
  final List<AnswerChoice> _choices;

  const MultipleChoiceQuestionData({
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

  List<AnswerChoice> get choices => _choices;

  bool isCorrect(AnswerChoice answerChoice) => answerChoice.isCorrect;
}

class DropdownQuestionData extends QuestionData {
  final String _id;
  final String _question;
  final List<AnswerChoice> _choices;

  const DropdownQuestionData({
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

  List<AnswerChoice> get choices => _choices;

  bool isCorrect(AnswerChoice answerChoice) => answerChoice.isCorrect;
}

class TrueFalseQuestionData extends QuestionData {
  final String _id;
  final String _question;
  final bool _answer;

  const TrueFalseQuestionData({
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

  bool get answer => _answer;

  bool isCorrect(bool answer) => answer == _answer;
}

class FillInTheBlankQuestionData extends QuestionData {
  final String _id;
  final String _question;
  final String _answer;

  const FillInTheBlankQuestionData({
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

  String get answer => _answer;
}
