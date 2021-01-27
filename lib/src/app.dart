import 'package:flutter/material.dart';

import 'user_interface/screens/question_screen.dart';

class FblaLexicon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FBLA Lexicon'),
      ),
      body: QuestionScreen(),
    );
  }
}
