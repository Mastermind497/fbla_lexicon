import 'question_foundation.dart';

export 'answered_questions.dart';
export 'question_foundation.dart';

class MultipleChoiceQuestionData implements QuestionData {
  final String _id;
  final String _question;
  final List<AnswerChoice> _choices;

  const MultipleChoiceQuestionData({
    required id,
    required question,
    required choices,
  })   : _question = question,
        _choices = choices,
        _id = id;

  String get id => _id;

  String get question => _question;

  List<AnswerChoice> get choices => _choices;

  bool isCorrect(AnswerChoice answerChoice) => answerChoice.isCorrect;
}

class DropdownQuestionData implements QuestionData {
  final String _id;
  final String _question;
  final List<AnswerChoice> _choices;

  const DropdownQuestionData({
    required id,
    required question,
    required choices,
  })   : _question = question,
        _choices = choices,
        _id = id;

  String get id => _id;

  String get question => _question;

  List<AnswerChoice> get choices => _choices;

  bool isCorrect(AnswerChoice answerChoice) => answerChoice.isCorrect;
}

class TrueFalseQuestionData implements QuestionData {
  final String _id;
  final String _question;
  final bool _answer;

  const TrueFalseQuestionData({
    required id,
    required question,
    required answer,
  })   : _question = question,
        _answer = answer,
        _id = id;

  String get id => _id;

  String get question => _question;

  bool get answer => _answer;

  bool isCorrect(bool answer) => answer == _answer;
}

class FillInTheBlankQuestionData implements QuestionData {
  final String _id;
  final String _question;
  final String _answer;

  const FillInTheBlankQuestionData({
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

class MatchingAnswerChoices implements RawQuestionData {
  final String _id;
  final String _first;
  final String _second;

  const MatchingAnswerChoices({
    required String first,
    required String second,
    required String id,
  })   : _id = id,
        _first = first,
        _second = second;

  String get id => _id;

  String get first => _first;

  String get second => _second;

  bool match(MatchingAnswerChoices o) {
    return (_first == o.first && _second == o.second);
  }
}

class MatchingQuestionData {
  final List<MatchingAnswerChoices> _choices;

  const MatchingQuestionData({
    required List<MatchingAnswerChoices> choices,
  }) : _choices = choices;

  List<MatchingAnswerChoices> get choices => _choices;

  Iterator<MatchingAnswerChoices> get getIterator => _choices.iterator;
}
