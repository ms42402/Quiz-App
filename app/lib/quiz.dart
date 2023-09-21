import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //what we are doing right now:
  //rednering screens by storing different screens
  //in the activescreen var
  //this causes us to use the initstate, which

  /** 2nd way -> does not require the extra initstate function
   * var activeScreen = 'start-sreen'; 
   * 
   * void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen'; 
    }); 
  }
   * 
   */

  //you can store widgets in variables
  //the ? means that the value of the variable
  //can also be null

  List<String> selectedAnswers = [];

  //Widget? activeScreen; //StartScreen(switchScreen);

  var activeScreen = 'start-screen';


  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        //selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {

    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers,);
    }


    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.deepPurple,
              Color.fromARGB(255, 208, 151, 218),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenWidget,
          //(2nd way) activescreen == 'start-screen' ? StartScreen(switchScreen) : const QuestionScreen;
        ),

        // Container(
        //   decoration: const BoxDecoration(
        //     color: Colors.purple,
        //   ),
        //   child: Center(
        //     child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         Image.asset(
        //           'assets/images/quiz-logo.png',
        //           width: 250,
        //         ),
        //         const Text(
        //           'Learn Flutter the Fun Way!',
        //           style: TextStyle(fontSize: 25),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
