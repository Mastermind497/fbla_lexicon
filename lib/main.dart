import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/routes.dart';
import 'src/user_interface/theme/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appData(),
      home: FblaLexicon(),
      routes: routes,
    );
  }
}
