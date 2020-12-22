abstract class RawQuestionData {
  String get id;
}

abstract class QuestionData implements RawQuestionData {
  String get id;
  String get question;
}

class AnswerChoice {
  final String _content;
  final bool _isCorrect;

  const AnswerChoice(
    this._content, [
    this._isCorrect = false,
  ]);

  String get content => _content;

  bool get isCorrect => _isCorrect;
}
