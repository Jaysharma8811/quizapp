import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Data/localdata/questions.dart';
import '../widets/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key,required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++; // increments the value by 1
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Text(
        currentQuestion.text,
            style: GoogleFonts.lato(
              color: const  Color.fromARGB(255, 201, 153, 251),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
             textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ...currentQuestion.answers.map(
            (answer) => AnswerButton(answerText: answer, onTap: (){answerQuestion(answer);}),
          ),
        ],
      ),
    );
  }
}