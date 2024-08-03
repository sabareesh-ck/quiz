import 'package:flutter/material.dart';
import 'package:v_basis/data/ques.dart';
import 'package:v_basis/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.finalanswer, this.restartScreen, {super.key});
  final void Function() restartScreen;
  final List<String> finalanswer;
  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < finalanswer.length; i++) {
      summary.add({
        'question_index': i,
        'questions': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'choosen_answer': finalanswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummary();
    final no_total = questions.length;
    final no_correct = summaryData.where((data) {
      return data['choosen_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You Answered $no_correct out of $no_total Correctly",
              style: GoogleFonts.playfairDisplay(
                  color: Colors.white, fontSize: 23),
            ),
            const SizedBox(height: 30),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: restartScreen,
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white)),
                icon: const Icon(Icons.restart_alt_outlined,
                    color: Color.fromARGB(255, 56, 13, 130)),
                label: Text("Restart Quiz",
                    style: TextStyle(color: Colors.deepPurple[800])))
          ],
        ),
      ),
    );
  }
}
