import 'package:flutter/material.dart';

import '../../../business_logic/models/question.dart';
import '../../theme/style.dart';
import '../question_widgets.dart';
import 'question_data_widget.dart';

class FreeResponseWidget extends StatefulWidget implements QuestionWidget {
  final FreeResponseQuestionData data;
  final int questionNumber;
  final void Function() nextQuestion, previousQuestion;

  const FreeResponseWidget(
    this.data,
    this.questionNumber, {
    this.nextQuestion,
    this.previousQuestion,
  });

  @override
  _FreeResponseWidgetState createState() => _FreeResponseWidgetState();
}

class _FreeResponseWidgetState extends State<FreeResponseWidget> {
  TextEditingController textEditingController = TextEditingController();

  void changedValue(String value) {
    widget.data.selected = value;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data.selected != null)
      textEditingController.text = widget.data.selected;
    return SingleChildScrollView(
      child: Column(
        children: [
          QuestionDataWidget(
            widget.data,
            widget.questionNumber,
            size: 0.45,
            next: widget.nextQuestion,
            previous: widget.previousQuestion,
          ),
          Padding(
            padding: createPadding(context, 2),
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(borderRadius: borderRadius),
                labelText: 'Answer',
              ),
              controller: textEditingController,
              onSubmitted: (String value) => changedValue(value),
            ),
          )
        ],
      ),
    );
  }
}
