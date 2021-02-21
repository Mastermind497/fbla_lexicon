import 'package:fbla_lexicon/src/user_interface/screens/end_screen.dart';
import 'package:fbla_lexicon/src/user_interface/screens/question_screen.dart';
import 'package:flutter/material.dart';

import 'user_interface/screens/welcome_screen.dart';

final routes = <String, Widget Function(BuildContext)>{
  WelcomeScreen.route: (context) => WelcomeScreen(),
  QuestionScreen.route: (context) => QuestionScreen(),
  EndScreen.route: (context) => EndScreen(),
};
