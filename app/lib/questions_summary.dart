import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.data, {super.key});

  final List<Map<String, Object>> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: data.map((data) {
          return Row(
            children: [
              Text(
                ((data['question_index'] as int) + 1).toString(),
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20, 
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    //const Text("this is printing right"),
                    Text(
                      (data['question']).toString(),
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      //textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      (data['user_answer']).toString(),
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                      //textAlign: TextAlign.left, 
                    ),
                    Text(
                      (data['correct_answer']).toString(),
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 216, 133, 231),
                        fontSize: 13, 
                      ),
                      //textAlign: TextAlign.left, 
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList()),
      ),
    );
  }
}
