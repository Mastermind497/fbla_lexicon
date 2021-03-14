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

const questionStyleA = const TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
);

const questionStyleB = const TextStyle(
  fontSize: 24,
);

const buttonStyle = const TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

final regularChoice = TextStyle(
  fontSize: 20,
  color: fblaBlue,
);

const answeredChoice = const TextStyle(
  fontSize: 20,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

final endScore = TextStyle(
  fontSize: 80,
  color: fblaBlue,
  fontWeight: FontWeight.bold,
);

const percentFont = const TextStyle(
  fontSize: 20,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

final selectionHeadingCorrect = TextStyle(
  fontWeight: FontWeight.bold,
  color: correctColor,
  fontSize: 20,
);

final selectionHeadingIncorrect = TextStyle(
  fontWeight: FontWeight.bold,
  color: incorrectColor,
  fontSize: 20,
);

final selectionBodyCorrect = TextStyle(
  color: correctColor,
  fontSize: 20,
);

const bigGreyText = TextStyle(
  color: Colors.grey,
  fontSize: 50,
);

final selectionBodyIncorrect = TextStyle(
  color: incorrectColor,
  fontSize: 20,
);

final correctText = TextSpan(
  text: 'Correct!',
  style: TextStyle(
    fontWeight: FontWeight.bold,
    color: correctColor,
    fontSize: 20,
  ),
);

const extraSpacing = const SizedBox(height: 10);

final Color fblaBlue = createMaterialColor(Color.fromRGBO(0, 82, 155, 1));
final Color fblaRed = createMaterialColor(Color.fromRGBO(190, 44, 55, 1));
final Color correctColor = createMaterialColor(Color.fromRGBO(6, 214, 160, 1));
final Color incorrectColor = fblaRed;

const double spaceMultiplier = 0.01;
const double questionSize = 0.3;
const BorderRadius borderRadius =
    const BorderRadius.all(const Radius.circular(15));
final RoundedRectangleBorder rectangleBorder =
    RoundedRectangleBorder(borderRadius: borderRadius);

EdgeInsets createPadding(BuildContext context, [double size = 1]) {
  return EdgeInsets.symmetric(
    horizontal: MediaQuery.of(context).size.width * spaceMultiplier * size,
    vertical: MediaQuery.of(context).size.height * spaceMultiplier * size / 10,
  );
}

EdgeInsets createMargin(BuildContext context) {
  return EdgeInsets.symmetric(
    horizontal: MediaQuery.of(context).size.width * spaceMultiplier / 2,
    vertical: MediaQuery.of(context).size.height * spaceMultiplier / 2,
  );
}
