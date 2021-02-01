import 'package:fbla_lexicon/src/user_interface/screens/question_screen.dart';
import 'package:flutter/material.dart';

import 'user_interface/screens/welcome_screen.dart';

final routes = <String, Function(BuildContext)>{
  '/': (context) => WelcomeScreen(),
  QuestionScreen.route: (context) => QuestionScreen(),
};
