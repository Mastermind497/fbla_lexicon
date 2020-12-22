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
