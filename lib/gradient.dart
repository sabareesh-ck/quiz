import 'package:flutter/material.dart';
import 'package:v_basis/text.dart';

class StartScreen extends StatelessWidget {
  @override
  const StartScreen(this.startquiz, {super.key});
  final void Function() startquiz;
  final asset = 'assets/images/quiz-logo.png';
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(asset,
              width: 300, color: const Color.fromARGB(150, 255, 255, 255)),
          /*           Opacity(
              opacity: 0.1,
              child: Image.asset(
                asset,
                width: 300,
              ),
            ),*/
          const SizedBox(height: 80),
          const Style("Learn Flutter the fun way !!"),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startquiz,
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 255, 255, 255)),
            icon: const Icon(Icons.ring_volume),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
