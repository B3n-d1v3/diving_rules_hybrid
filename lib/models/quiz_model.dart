import 'dart:math';
import 'package:flutter/material.dart';

import 'package:diving_rules_hybrid/models/penalty_model.dart';

import '../models/globals.dart';

// the quiz model to store the list of questions and the list of answers with the same index and the score to this quiz
class Quiz {
  // list of Question ID's for a quiz
  late List<int> questions = [];

  // List of user answers
  late List<Penalty> answers = [];

  // Rewards score
  int score = 0;

// Quiz({
//   required this.questions,
//   required this.answers,
//   required this.score,
// });
}

// Generate new Quiz question list in currentQuiz Object
newQuiz() {
  // log previous quiz content to keep quiz history
  logUserAnswer();
  // Init new quiz information
  currentQuiz.questions = newListOfQuestions();
}

// create a new Quiz list
newListOfQuestions() {
  List<int> questionList = [];
  Random random = Random();
  for (var i = 0; i < quizTotalQuestionNumber; i++) {
    int randomNumber = random.nextInt(penaltySummary.penalties.length);
    if (!questionList.contains(randomNumber)) {
      questionList.add(randomNumber);
    } else {
      i--;
    }
  }
  // debugPrint('>>>>> Quiz Model > newListOfQuestions: $questionList');
  return questionList;
}

// Log the answer provided by the user in currentQuiz Object
logUserAnswer() {
  // TODO: log previous quiz content to keep quiz history
}
