import 'package:flutter/material.dart';
import 'package:v_basis/data/ques.dart';
import 'package:v_basis/gradient.dart';
import 'package:v_basis/questions.dart';
import 'package:v_basis/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = 'start_screen';
  /*@override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }*/

  void switchScreen() {
    setState(() {
      activeScreen = 'switch-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartAnswer() {
    selectedAnswer = [];
    setState(() {
      activeScreen = 'switch-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screen = StartScreen(switchScreen);
    if (activeScreen == 'switch-screen') {
      screen = Question(chooseAnswer);
    } else if (activeScreen == 'result-screen') {
      screen = ResultScreen(selectedAnswer, restartAnswer);
    }
    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 39, 3, 112),
            Color.fromARGB(255, 61, 17, 150)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: screen,
      ),
    ));
  }
}
