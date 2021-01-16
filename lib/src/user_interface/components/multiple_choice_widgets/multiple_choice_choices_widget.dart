import 'package:flutter/material.dart';

import '../../../user_interface/theme/style.dart';
import '../../../business_logic/models/question.dart';
import 'multiple_choice_answer_widget.dart';

class MultipleChoiceChoicesWidget {
  final List<AnswerChoice> choices;
  final EdgeInsets padding;
  void Function(AnswerChoice) onTap;

  MultipleChoiceChoicesWidget(
    this.choices, [
    this.padding = const EdgeInsets.all(10),
  ]);

  set setOnTap(void Function(AnswerChoice) fun) => onTap = fun;

  set padding(EdgeInsets padding) => this.padding = padding;

  List<MultipleChoiceAnswerWidget> get answerChoices {
    var answerChoices = <MultipleChoiceAnswerWidget>[];
    for (var choice in choices) {
      answerChoices.add(
        MultipleChoiceAnswerWidget(choice, padding, onTap),
      );
    }

    return answerChoices;
  }

  List<MultipleChoiceAnswerWidget> withChoosing(AnswerChoice answer) {
    var newAnswerChoiceWidgets = <MultipleChoiceAnswerWidget>[];

    for (var curChoice in choices) {
      if (curChoice == answer) {
        newAnswerChoiceWidgets.add(
          MultipleChoiceAnswerWidget(
            curChoice,
            padding,
            onTap,
            (curChoice.isCorrect ? correctColor : incorrectColor),
          ),
        );
      } else {
        newAnswerChoiceWidgets.add(
          MultipleChoiceAnswerWidget(
            curChoice,
            padding,
            onTap,
            (curChoice.isCorrect ? correctColor : Colors.white),
          ),
        );
      }
    }

    return newAnswerChoiceWidgets;
  }
}
