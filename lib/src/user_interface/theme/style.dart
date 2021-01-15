import 'package:flutter/material.dart';

import 'color_generator.dart';

ThemeData appData() {
  return ThemeData(
    primaryColor: fblaBlue,
    accentColor: fblaRed,
    textTheme: const TextTheme(
      headline5: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

TextStyle questionStyleA = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
);

TextStyle questionStyleB = TextStyle(
  fontSize: 24,
);

Color fblaBlue = createMaterialColor(Color.fromRGBO(0, 82, 155, 1));

Color fblaRed = createMaterialColor(Color.fromRGBO(190, 44, 55, 1));

Color correctColor = createMaterialColor(Color.fromRGBO(6, 214, 160, 1));

Color incorrectColor = fblaRed;
