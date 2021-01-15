import 'package:flutter/material.dart';

import '../../../user_interface/theme/style.dart';
import '../../../business_logic/models/question.dart';
import 'multiple_choice_answer_widget.dart';

class MultipleChoiceAnswerChoicesWidget extends StatefulWidget {
  final List<AnswerChoice> choices;

  static final EdgeInsets padding = EdgeInsets.all(10); // MultipleChoiceQuestionWidget.padding;

  MultipleChoiceAnswerChoicesWidget(this.choices);

  @override
  _MultipleChoiceAnswerChoicesWidgetState createState() =>
      _MultipleChoiceAnswerChoicesWidgetState();
}

class _MultipleChoiceAnswerChoicesWidgetState extends State<MultipleChoiceAnswerChoicesWidget> {
  final List<MultipleChoiceAnswerWidget> answerChoices = [];

  _MultipleChoiceAnswerChoicesWidgetState() {
    answerChoices.addAll(_generateAnswerChoices(MultipleChoiceAnswerChoicesWidget.padding));
  }

  List<MultipleChoiceAnswerWidget> _generateAnswerChoices(EdgeInsets padding) {
    return List<MultipleChoiceAnswerWidget>.generate(
      widget.choices.length,
      (index) => MultipleChoiceAnswerWidget(
        widget.choices[index],
        padding,
        updateAnswers,
      ),
    );
  }

  void updateAnswers(AnswerChoice answered) {
    List<MultipleChoiceAnswerWidget> nowColored = [];
    for (var choice in answerChoices) {
      if (choice.choice == answered) {
        nowColored.add(
          MultipleChoiceAnswerWidget(
            choice.choice,
            MultipleChoiceAnswerChoicesWidget.padding,
            updateAnswers,
            (answered.isCorrect ? correctColor : incorrectColor),
          ),
        );
      } else if (choice.choice.isCorrect) {
        nowColored.add(MultipleChoiceAnswerWidget(
            answered, MultipleChoiceAnswerChoicesWidget.padding, updateAnswers, correctColor));
      } else {
        nowColored.add(choice);
      }
    }

    setState(() {
      answerChoices.clear();
      answerChoices.addAll(nowColored);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [...answerChoices],
    );
  }
}
