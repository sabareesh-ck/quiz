import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: summaryData.map((data) {
            return Row(
              children: [
                (data['choosen_answer'] == data['correct_answer'])
                    ? Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.greenAccent),
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: const TextStyle(fontSize: 15),
                        ),
                      )
                    : Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.redAccent),
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          data['questions'] as String,
                          style: GoogleFonts.lato(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          data['choosen_answer'] as String,
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: GoogleFonts.montserrat(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
