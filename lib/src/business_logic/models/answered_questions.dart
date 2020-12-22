import 'question_foundation.dart';

class AnsweredMultipleChoiceQuestion {
  final String _id;
  final AnswerChoice _picked;
  final bool _correct;
  AnsweredMultipleChoiceQuestion({
    required String id,
    required AnswerChoice picked,
    required bool correct,
  })   : _id = id,
        _picked = picked,
        _correct = correct;

  String get id => _id;

  AnswerChoice get picked => _picked;

  bool get isCorrect => _correct;
}
