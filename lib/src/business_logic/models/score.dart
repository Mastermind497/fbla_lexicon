import 'question.dart';

class Score {
  final List<QuestionData> questionDataList;
  final int numCorrect;
  final Percent correctPercent;

  Score(this.questionDataList)
      : numCorrect = questionDataList.getNumCorrect,
        correctPercent =
            Percent(questionDataList.getNumCorrect, questionDataList.length);

  List<AnsweredQuestion> get answeredQuestionList {
    List<AnsweredQuestion> list = [];
    questionDataList.forEach((element) => list.add(element.toAnsweredQuestion));
    return list;
  }

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
