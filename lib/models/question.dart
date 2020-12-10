abstract class Question {
  final String _id;
  final String _question;

  const Question({
    required id,
    required question,
  })   : _question = question,
        _id = id;

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

class MultipleChoiceQuestion implements Question {
  final String _id;
  final String _question;
  final List<AnswerChoice> _choices;

  const MultipleChoiceQuestion({
    required id,
    required question,
    required choices,
  })   : _question = question,
        _choices = choices,
        _id = id;

  String get id => _id;

  String get question => _question;

  List<AnswerChoice> get choices => _choices;
}

class DropdownQuestion implements Question {
  final String _id;
  final String _question;
  final List<AnswerChoice> _choices;

  const DropdownQuestion({
    required id,
    required question,
    required choices,
  })   : _question = question,
        _choices = choices,
        _id = id;

  String get id => _id;

  String get question => _question;

  List<AnswerChoice> get choices => _choices;
}

class TrueFalseQuestion implements Question {
  final String _id;
  final String _question;
  final bool _answer;

  const TrueFalseQuestion({
    required id,
    required question,
    required answer,
  })   : _question = question,
        _answer = answer,
        _id = id;

  String get id => _id;

  String get question => _question;

  bool get answer => _answer;
}

class FillInTheBlankQuestion implements Question {
  final String _id;
  final String _question;
  final String _answer;

  const FillInTheBlankQuestion({
    required String id,
    required String question,
    required String answer,
  })   : _question = question,
        _answer = answer,
        _id = id;

  String get id => _id;

  String get question => _question;

  String get answer => _answer;
}

class MatchingAnswerChoices {
  final String _id;
  final String _first;
  final String _second;

  const MatchingAnswerChoices(
    this._first,
    this._second, {
    required String id,
  }) : _id = id;

  String get id => _id;

  String get first => _first;

  String get second => _second;

  bool match(MatchingAnswerChoices o) {
    return (_first == o.first && _second == o.second);
  }
}

class MatchingQuestion {
  final List<MatchingAnswerChoices> _choices;

  const MatchingQuestion({
    required List<MatchingAnswerChoices> choices,
  }) : _choices = choices;

  List<MatchingAnswerChoices> get choices => _choices;
}
