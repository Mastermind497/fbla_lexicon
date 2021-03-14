import 'package:flutter/material.dart';

import '../theme/style.dart';
import 'question_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const route = '/welcome';
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(
        () {
          setState(() {});
        },
      );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget quickStartButton(MediaQueryData mediaQuery, String text) => Container(
        height: mediaQuery.size.height * 0.1,
        width: mediaQuery.size.height * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(mediaQuery.size.height * 0.3),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: mediaQuery.size.height * 0.05,
              offset: Offset(0.0, 2.0),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              fblaBlue,
              fblaRed,
            ],
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: buttonStyle,
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void startQuickQuiz(BuildContext context, title) {
    Navigator.of(context).pushNamed(QuestionScreen.route, arguments: {
      'numQuestions': 5,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    _scale = (1 - _controller.value);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () => startQuickQuiz(context, 'Quick Quiz'),
              onTapDown: _onTapDown,
              onTapUp: _onTapUp,
              child: Transform.scale(
                scale: _scale,
                child: quickStartButton(
                  MediaQuery.of(context),
                  'Quick Start',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
