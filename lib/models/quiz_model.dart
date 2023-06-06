import 'dart:math';

import 'package:diving_rules_hybrid/models/penalty_model.dart';
import 'package:flutter/material.dart';

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
  // Init new quiz information
  currentQuiz.questions = newListOfQuestions();
  currentQuiz.answers = [];
  currentQuiz.score = 0;
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
  // Debug with standard list
  questionList = [0, 1, 2, 3, 6];
  debugPrint('>>>>> Quiz Model > newListOfQuestions: $questionList');

  return questionList;
}

// Log the answer provided by the user in currentQuiz Object
logUserAnswer() {
  // TODO: log previous quiz content to keep quiz history in a new object to create 'allQuizzes'
  var loggedPenalty = Penalty(
      id: currentQuiz.questions[currentQuizQuestionIndex - 1],
      description: '',
      rules: [],
      sanctionValue: currentPenaltyStatus.userSanctionSelection.value,
      referee: currentPenaltyStatus.ownershipReferee.value,
      judge: currentPenaltyStatus.ownershipJudge.value);
  // currentQuiz.answers[currentQuizQuestionIndex - 1] = loggedPenalty;
  currentQuiz.answers.add(loggedPenalty);
}

userAnswerDebug({required int index}) {
  debugPrint('>>>>> Quiz Model > User Answer Debug ---:');
  debugPrint(
      '>>>>> Quiz Model > currentPenaltyStatus.penaltyZeroPts: ${currentPenaltyStatus.penaltyZeroPts.value}');
  debugPrint(
      '>>>>> Quiz Model > currentPenaltyStatus.penaltyMaxTwoPts: ${currentPenaltyStatus.penaltyMaxTwoPts.value}');
  debugPrint(
      '>>>>> Quiz Model > currentPenaltyStatus.penaltyMaxFourHalfPts: ${currentPenaltyStatus.penaltyMaxFourHalfPts.value}');
  debugPrint(
      '>>>>> Quiz Model > currentPenaltyStatus.penaltyMinusTwoPts: ${currentPenaltyStatus.penaltyMinusTwoPts.value}');
  debugPrint(
      '>>>>> Quiz Model > currentPenaltyStatus.penaltyMinusHalfToTwoPts: ${currentPenaltyStatus.penaltyMinusHalfToTwoPts.value}');
  debugPrint(
      '>>>>> Quiz Model > currentPenaltyStatus.penaltyJudgeOpinion: ${currentPenaltyStatus.penaltyJudgeOpinion.value}');
}
