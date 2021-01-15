import 'package:flutter/material.dart';

import '../question_widgets.dart';
import '../../../user_interface/theme/style.dart';
import '../../../business_logic/models/question.dart';
import 'multiple_choice_question_widget.dart';

class MultipleChoiceAnswerChoicesWidget extends StatefulWidget {
  final List<AnswerChoice> choices;

  static final EdgeInsets padding = MultipleChoiceQuestionWidget.padding;

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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [...answerChoices],
    );
  }
}

class MultipleChoiceAnswerWidget extends StatelessWidget {
  final AnswerChoice choice;
  final EdgeInsets padding;
  final Function onTap;
  final Color color;

  static const double spaceMultiplier = MultipleChoiceQuestionWidget.spaceMultiplier;
  static final BorderRadius br = MultipleChoiceQuestionWidget.br;

  MultipleChoiceAnswerWidget(this.choice, this.padding, this.onTap, [this.color = Colors.white]);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);

    return Expanded(
      child: Padding(
        padding: padding,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: br),
          child: InkWell(
            splashColor: (choice.isCorrect ? correctColor : incorrectColor),
            onTap: () => onTap(choice),
            borderRadius: br,
            child: Container(
              width: mq.size.width,
              child: Text(
                choice.content,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
