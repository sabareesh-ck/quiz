import 'package:flutter/material.dart';

class Style extends StatelessWidget {
  const Style(this.text, {super.key});
  final String text;
  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
          fontStyle: FontStyle.normal,
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 25),
    );
  }
}
