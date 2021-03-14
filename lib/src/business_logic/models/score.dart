import 'question.dart';

class Score {
  final List<AnsweredQuestion> answeredQuestionList;
  final int numCorrect;
  final Percent correctPercent;

  Score(this.answeredQuestionList)
      : numCorrect = answeredQuestionList.getNumCorrect,
        correctPercent = Percent(
            answeredQuestionList.getNumCorrect, answeredQuestionList.length);

  int get getNumCorrect => numCorrect;

  Percent get getCorrectPercent => correctPercent;
}

class Percent {
  final int score;
  final int options;

  Percent(this.score, this.options);

  double get asDouble => (score * 1.0) / options;

  @override
  String toString() {
    return "${(score / (1.0 * options) * 100)}%";
  }
}
