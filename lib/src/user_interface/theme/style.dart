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

TextStyle regularChoice = TextStyle(
  fontSize: 20,
  color: fblaBlue,
);

TextStyle answeredChoice = TextStyle(
  fontSize: 20,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

Color fblaBlue = createMaterialColor(Color.fromRGBO(0, 82, 155, 1));
Color fblaRed = createMaterialColor(Color.fromRGBO(190, 44, 55, 1));
Color correctColor = createMaterialColor(Color.fromRGBO(6, 214, 160, 1));
Color incorrectColor = fblaRed;

const double spaceMultiplier = 0.01;
const double questionSize = 0.3;
final BorderRadius borderRadius = BorderRadius.circular(15);

EdgeInsets createPadding(BuildContext context) {
  return EdgeInsets.symmetric(
    horizontal: MediaQuery.of(context).size.width * spaceMultiplier,
    vertical: MediaQuery.of(context).size.height * spaceMultiplier / 10,
  );
}

EdgeInsets createMargin(BuildContext context) {
  return EdgeInsets.symmetric(
    horizontal: MediaQuery.of(context).size.width * spaceMultiplier / 2,
    vertical: MediaQuery.of(context).size.height * spaceMultiplier / 2,
  );
}
