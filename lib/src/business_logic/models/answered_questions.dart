import 'question_foundation.dart';

class AnsweredMultipleChoiceQuestion implements AnsweredQuestion {
  final String _id;
  final AnswerChoice _picked;
  final AnswerChoice _correctAnswer;

  const AnsweredMultipleChoiceQuestion({
    required String id,
    required AnswerChoice picked,
    required AnswerChoice correctAnswer,
  })   : _id = id,
        _picked = picked,
        _correctAnswer = correctAnswer;

  String get id => _id;

  AnswerChoice get picked => _picked;

  bool get isCorrect => _picked == _correctAnswer;
}

class AnsweredDropdownQuestion implements AnsweredQuestion {
  final String _id;
  final AnswerChoice _picked;
  final AnswerChoice _correctAnswer;

  const AnsweredDropdownQuestion({
    required String id,
    required AnswerChoice picked,
    required AnswerChoice correctAnswer,
  })   : _id = id,
        _picked = picked,
        _correctAnswer = correctAnswer;

  String get id => _id;

  AnswerChoice get picked => _picked;

  bool get isCorrect => _picked == _correctAnswer;
}

class AnsweredTrueFalseQuestion implements AnsweredQuestion {
  final String _id;
  final bool _picked;
  final bool _correctAnswer;

  const AnsweredTrueFalseQuestion({
    required String id,
    required bool picked,
    required bool correctAnswer,
  })   : _id = id,
        _picked = picked,
        _correctAnswer = correctAnswer;

  String get id => _id;

  bool get picked => _picked;

  bool get isCorrect => _picked == _correctAnswer;
}

class AnsweredFillInTheBlankQuestion implements AnsweredQuestion {
  final String _id;
  final String _picked;
  final String _correctAnswer;

  const AnsweredFillInTheBlankQuestion({
    required String id,
    required String picked,
    required String correctAnswer,
  })   : _id = id,
        _picked = picked,
        _correctAnswer = correctAnswer;

  String get id => _id;

  String get picked => _picked;

  bool get isCorrect => _picked == _correctAnswer;
}

class AnsweredMatchingAnswerChoices implements AnsweredQuestion {
  final String _id;
  final String _picked;
  final String _first;
  final String _second;

  const AnsweredMatchingAnswerChoices({
    required String id,
    required String picked,
    required String first,
    required String second,
  })   : _id = id,
        _picked = picked,
        _first = first,
        _second = second;

  String get id => _id;

  String get picked => _picked;

  bool get isCorrect => _picked == _first || _picked == _second;
}
