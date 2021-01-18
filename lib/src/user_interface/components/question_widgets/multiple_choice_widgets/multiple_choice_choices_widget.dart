import 'package:flutter/material.dart';

import '../../../theme/style.dart';
import '../../../../business_logic/models/question.dart';

import 'multiple_choice_answer_widget.dart';

class MultipleChoiceChoicesWidget {
  final List<AnswerChoice> choices;
  AnswerChoice selected;
  void Function(AnswerChoice) onTap;

  MultipleChoiceChoicesWidget(this.choices, [this.selected, this.onTap]);

  List<MultipleChoiceAnswerWidget> get answerChoices {
    var answerChoices = <MultipleChoiceAnswerWidget>[];
    for (var choice in choices) {
      answerChoices.add(
        MultipleChoiceAnswerWidget(choice, onTap),
      );
    }

    return answerChoices;
  }

  List<MultipleChoiceAnswerWidget> get getAfterChosen {
    if (selected == null) return answerChoices;

    var newAnswerChoiceWidgets = <MultipleChoiceAnswerWidget>[];

    for (var choice in choices) {
      newAnswerChoiceWidgets.add(
        MultipleChoiceAnswerWidget(
          choice,
          onTap,
          (choice == selected ? fblaBlue : Colors.white),
        ),
      );
    }

    return newAnswerChoiceWidgets;
  }
}
