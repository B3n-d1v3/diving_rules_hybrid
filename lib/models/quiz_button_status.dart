import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'globals.dart';

// Question page - buttons model for view
// class ButtonsStatus {
//   // penalty buttons status
//   bool penaltyZeroPts = false;
//   bool penaltyMaxTwoPts = false;
//   bool penaltyMaxFourHalfPts = false;
//   bool penaltyMinusTwoPts = false;
//   bool penaltyMinusHalfToTwoPts = false;
//   bool penaltyJudgeOpinion = false;
//
//   // ownership buttons status
//   bool ownershipReferee = false;
//   bool ownershipJudge = false;
//
//   // Other data needed
//   // Sanction set by the user
//   int userSanctionSelection = 500;
//
//   // has the user answered enough elements to go to the next question (one sanction and at least one owner)
//   bool nextQuestion = false;
// }

// Test with Getx observable object
class ButtonsStatus extends GetxController {
  // penalty buttons status
  late RxBool penaltyZeroPts = false.obs;
  late RxBool penaltyMaxTwoPts = false.obs;
  late RxBool penaltyMaxFourHalfPts = false.obs;
  late RxBool penaltyMinusTwoPts = false.obs;
  late RxBool penaltyMinusHalfToTwoPts = false.obs;
  late RxBool penaltyJudgeOpinion = false.obs;

  // ownership buttons status
  late RxBool ownershipReferee = false.obs;
  late RxBool ownershipJudge = false.obs;

  // Other data needed
  // Sanction set by the user
  late RxInt userSanctionSelection = RxInt(-1);

  // has the user answered enough elements to go to the next question (one sanction and at least one owner)
  late RxBool nextQuestion = false.obs;
}

// Reset the current question status display model
buttonStatusReset() {
  // Reset the current question status display model
  currentPenaltyStatus.penaltyZeroPts = false.obs;
  currentPenaltyStatus.penaltyMaxTwoPts = false.obs;
  currentPenaltyStatus.penaltyMaxFourHalfPts = false.obs;
  currentPenaltyStatus.penaltyMinusTwoPts = false.obs;
  currentPenaltyStatus.penaltyMinusHalfToTwoPts = false.obs;
  currentPenaltyStatus.penaltyJudgeOpinion = false.obs;

  currentPenaltyStatus.ownershipReferee = false.obs;
  currentPenaltyStatus.ownershipJudge = false.obs;

  currentPenaltyStatus.nextQuestion = false.obs;
  currentPenaltyStatus.userSanctionSelection = RxInt(-1);

  currentQuizNextQuestion = false;
}

// Set the ButtonsStatus Object to the penalty's status display model
// This is used by the error review page to set the data display model to the penalty's reference sanction & ownership
buttonAllStatusSet({required int penaltyNb}) {
  buttonPenaltyStatusSet(
      sanctionID: penaltySummary.penalties[penaltyNb].sanctionValue);

  currentPenaltyStatus.ownershipJudge =
      penaltySummary.penalties[penaltyNb].judge.obs;
  currentPenaltyStatus.ownershipReferee =
      penaltySummary.penalties[penaltyNb].referee.obs;
}

buttonPenaltyStatusSet({required int sanctionID}) {
  //int sanctionID = penaltySummary.penalties[penaltyNb].sanctionValue;
  if (sanctionID == 0) {
    currentPenaltyStatus.penaltyZeroPts = true.obs;
  } else {
    currentPenaltyStatus.penaltyZeroPts = false.obs;
  }
  if (sanctionID == 1) {
    currentPenaltyStatus.penaltyMaxTwoPts = true.obs;
  } else {
    currentPenaltyStatus.penaltyMaxTwoPts = false.obs;
  }
  if (sanctionID == 2) {
    currentPenaltyStatus.penaltyMaxFourHalfPts = true.obs;
  } else {
    currentPenaltyStatus.penaltyMaxFourHalfPts = false.obs;
  }
  if (sanctionID == 3) {
    currentPenaltyStatus.penaltyMinusTwoPts = true.obs;
  } else {
    currentPenaltyStatus.penaltyMinusTwoPts = false.obs;
  }
  if (sanctionID == 4) {
    currentPenaltyStatus.penaltyMinusHalfToTwoPts = true.obs;
  } else {
    currentPenaltyStatus.penaltyMinusHalfToTwoPts = false.obs;
  }
  if (sanctionID == 5) {
    currentPenaltyStatus.penaltyJudgeOpinion = true.obs;
  } else {
    currentPenaltyStatus.penaltyJudgeOpinion = false.obs;
  }
}

buttonPenaltyStatusChange({required int sanctionID}) {
  //currentPenaltyStatus.userSanctionSelection = sanctionID.obs;

  switch (sanctionID) {
    case 0:
      currentPenaltyStatus.penaltyZeroPts =
          RxBool(!currentPenaltyStatus.penaltyZeroPts.value);
      currentPenaltyStatus.penaltyMaxTwoPts = false.obs;
      currentPenaltyStatus.penaltyMaxFourHalfPts = false.obs;
      currentPenaltyStatus.penaltyMinusTwoPts = false.obs;
      currentPenaltyStatus.penaltyMinusHalfToTwoPts = false.obs;
      currentPenaltyStatus.penaltyJudgeOpinion = false.obs;
      break;
    case 1:
      currentPenaltyStatus.penaltyZeroPts = false.obs;
      currentPenaltyStatus.penaltyMaxTwoPts =
          RxBool(!currentPenaltyStatus.penaltyMaxTwoPts.value);
      currentPenaltyStatus.penaltyMaxFourHalfPts = false.obs;
      currentPenaltyStatus.penaltyMinusTwoPts = false.obs;
      currentPenaltyStatus.penaltyMinusHalfToTwoPts = false.obs;
      currentPenaltyStatus.penaltyJudgeOpinion = false.obs;
      break;
    case 2:
      currentPenaltyStatus.penaltyZeroPts = false.obs;
      currentPenaltyStatus.penaltyMaxTwoPts = false.obs;
      currentPenaltyStatus.penaltyMaxFourHalfPts =
          RxBool(!currentPenaltyStatus.penaltyMaxFourHalfPts.value);
      currentPenaltyStatus.penaltyMinusTwoPts = false.obs;
      currentPenaltyStatus.penaltyMinusHalfToTwoPts = false.obs;
      currentPenaltyStatus.penaltyJudgeOpinion = false.obs;
      break;
    case 3:
      currentPenaltyStatus.penaltyZeroPts = false.obs;
      currentPenaltyStatus.penaltyMaxTwoPts = false.obs;
      currentPenaltyStatus.penaltyMaxFourHalfPts = false.obs;
      currentPenaltyStatus.penaltyMinusTwoPts =
          RxBool(!currentPenaltyStatus.penaltyMinusTwoPts.value);
      currentPenaltyStatus.penaltyMinusHalfToTwoPts = false.obs;
      currentPenaltyStatus.penaltyJudgeOpinion = false.obs;
      break;
    case 4:
      currentPenaltyStatus.penaltyZeroPts = false.obs;
      currentPenaltyStatus.penaltyMaxTwoPts = false.obs;
      currentPenaltyStatus.penaltyMaxFourHalfPts = false.obs;
      currentPenaltyStatus.penaltyMinusTwoPts = false.obs;
      currentPenaltyStatus.penaltyMinusHalfToTwoPts =
          RxBool(!currentPenaltyStatus.penaltyMinusHalfToTwoPts.value);
      currentPenaltyStatus.penaltyJudgeOpinion = false.obs;
      break;
    case 5:
      currentPenaltyStatus.penaltyZeroPts = false.obs;
      currentPenaltyStatus.penaltyMaxTwoPts = false.obs;
      currentPenaltyStatus.penaltyMaxFourHalfPts = false.obs;
      currentPenaltyStatus.penaltyMinusTwoPts = false.obs;
      currentPenaltyStatus.penaltyMinusHalfToTwoPts = false.obs;
      currentPenaltyStatus.penaltyJudgeOpinion =
          RxBool(!currentPenaltyStatus.penaltyJudgeOpinion.value);
      break;
    default:
  }
  if (currentPenaltyStatus.userSanctionSelection.value != sanctionID) {
    currentPenaltyStatus.userSanctionSelection = sanctionID.obs;
  } else {
    currentPenaltyStatus.userSanctionSelection = RxInt(-1);
  }
  //canUserGoNext();
  // buttonPenaltyDebug();
  return currentPenaltyStatus;
}

// Set the penalties and the ownership the the user's response
buttonAllStatusSetToUserAnswer({required int quizIndex}) {
  buttonPenaltyStatusSet(
      sanctionID: currentQuiz.answers[quizIndex].sanctionValue);
  currentPenaltyStatus.ownershipJudge =
      currentQuiz.answers[quizIndex].judge.obs;
  currentPenaltyStatus.ownershipReferee =
      currentQuiz.answers[quizIndex].referee.obs;
}

buttonPenaltyDebug() {
  debugPrint('>>>>> Button Status Object > penaltyButtonStatus ---:');
  debugPrint(
      '>>>>> currentPenaltyStatus.penaltyZeroPts: ${currentPenaltyStatus.penaltyZeroPts.value}');
  debugPrint(
      '>>>>> currentPenaltyStatus.penaltyMaxTwoPts: ${currentPenaltyStatus.penaltyMaxTwoPts.value}');
  debugPrint(
      '>>>>> currentPenaltyStatus.penaltyMaxFourHalfPts: ${currentPenaltyStatus.penaltyMaxFourHalfPts.value}');
  debugPrint(
      '>>>>> currentPenaltyStatus.penaltyMinusTwoPts: ${currentPenaltyStatus.penaltyMinusTwoPts.value}');
  debugPrint(
      '>>>>> currentPenaltyStatus.penaltyMinusHalfToTwoPts: ${currentPenaltyStatus.penaltyMinusHalfToTwoPts.value}');
  debugPrint(
      '>>>>> currentPenaltyStatus.penaltyJudgeOpinion: ${currentPenaltyStatus.penaltyJudgeOpinion.value}');
}

buttonOwnershipDebug() {
  debugPrint('>>>>> Button Status Object > OwnershipButtonStatus ---:');
  debugPrint(
      '>>>>> currentPenaltyStatus.ownershipReferee: ${currentPenaltyStatus.ownershipReferee.value}');
  debugPrint(
      '>>>>> currentPenaltyStatus.ownershipJudge: ${currentPenaltyStatus.ownershipJudge.value}');
}
