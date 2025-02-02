import 'package:flutter/material.dart';
import 'package:quizappp/viewQize/questions_screen.dart';
import 'package:quizappp/viewQize/result_screen.dart';
import 'package:quizappp/viewQize/start_screen.dart';

import '../Data/localdata/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  var  activeScreen='start_screen';

  void switchScreen(){
    setState(() {
      activeScreen='question_screen';
    });
  }
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }
  @override
  Widget build(context) {
    Widget  screenWidget=StartScreen(switchScreen);
    if(activeScreen=="question_screen")
      {
        screenWidget=  QuestionScreen(onSelectAnswer: chooseAnswer,);
      }
    if(activeScreen=="results-screen")
    {
      screenWidget=   ResultScreen(chosenAnswers: selectedAnswers,
      onRestart: restartQuiz,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration:const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,


            ),

          ),
          child:screenWidget ,
        ),
      ),
    );
  }
}
