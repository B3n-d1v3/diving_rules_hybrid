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
  currentPenaltyStatus.penaltyZeroPts(false);
  currentPenaltyStatus.penaltyMaxTwoPts(false);
  currentPenaltyStatus.penaltyMaxFourHalfPts(false);
  currentPenaltyStatus.penaltyMinusTwoPts(false);
  currentPenaltyStatus.penaltyMinusHalfToTwoPts(false);
  currentPenaltyStatus.penaltyJudgeOpinion(false);

  currentPenaltyStatus.ownershipReferee(false);
  currentPenaltyStatus.ownershipJudge(false);

  currentPenaltyStatus.nextQuestion(false);
  currentPenaltyStatus.userSanctionSelection(-1);

  // currentPenaltyStatus.penaltyZeroPts = false.obs;
  // currentPenaltyStatus.penaltyMaxTwoPts = false.obs;
  // currentPenaltyStatus.penaltyMaxFourHalfPts = false.obs;
  // currentPenaltyStatus.penaltyMinusTwoPts = false.obs;
  // currentPenaltyStatus.penaltyMinusHalfToTwoPts = false.obs;
  // currentPenaltyStatus.penaltyJudgeOpinion = false.obs;
  //
  // currentPenaltyStatus.ownershipReferee = false.obs;
  // currentPenaltyStatus.ownershipJudge = false.obs;
  //
  // currentPenaltyStatus.nextQuestion = false.obs;
  // currentPenaltyStatus.userSanctionSelection = RxInt(-1);

  currentQuizNextQuestion = false;
}

// Set the ButtonsStatus Object to the penalty's status display model
// This is used by the error review page to set the data display model to the penalty's reference sanction & ownership
buttonAllStatusSet({required int penaltyNb}) {
  buttonPenaltyStatusSet(
      sanctionID: penaltySummary.penalties[penaltyNb].sanctionValue);

  currentPenaltyStatus
      .ownershipJudge(penaltySummary.penalties[penaltyNb].judge);
  currentPenaltyStatus
      .ownershipReferee(penaltySummary.penalties[penaltyNb].referee);
}

// Set the penalty status sanctions to false and the sanction id correspondence to true
buttonPenaltyStatusSet({required int sanctionID}) {
  //int sanctionID = penaltySummary.penalties[penaltyNb].sanctionValue;
  if (sanctionID == 0) {
    currentPenaltyStatus.penaltyZeroPts(true);
  } else {
    currentPenaltyStatus.penaltyZeroPts(false);
  }
  if (sanctionID == 1) {
    currentPenaltyStatus.penaltyMinusTwoPts(true);
  } else {
    currentPenaltyStatus.penaltyMinusTwoPts(false);
  }
  if (sanctionID == 2) {
    currentPenaltyStatus.penaltyMaxTwoPts(true);
  } else {
    currentPenaltyStatus.penaltyMaxTwoPts(false);
  }
  if (sanctionID == 3) {
    currentPenaltyStatus.penaltyMaxFourHalfPts(true);
  } else {
    currentPenaltyStatus.penaltyMaxFourHalfPts(false);
  }
  if (sanctionID == 4) {
    currentPenaltyStatus.penaltyMinusHalfToTwoPts(true);
  } else {
    currentPenaltyStatus.penaltyMinusHalfToTwoPts(false);
  }
  if (sanctionID == 5) {
    currentPenaltyStatus.penaltyJudgeOpinion(true);
  } else {
    currentPenaltyStatus.penaltyJudgeOpinion(false);
  }
}

// Set the penalty status sanctions to false and the sanction id correspondence to it's oposit value
buttonPenaltyStatusChange({required int sanctionID}) {
  //currentPenaltyStatus.userSanctionSelection = sanctionID.obs;

  switch (sanctionID) {
    case 0:
      currentPenaltyStatus
          .penaltyZeroPts(!currentPenaltyStatus.penaltyZeroPts.value);
      currentPenaltyStatus.penaltyMinusTwoPts(false);
      currentPenaltyStatus.penaltyMaxTwoPts(false);
      currentPenaltyStatus.penaltyMaxFourHalfPts(false);
      currentPenaltyStatus.penaltyMinusHalfToTwoPts(false);
      currentPenaltyStatus.penaltyJudgeOpinion(false);
      break;
    case 1:
      currentPenaltyStatus.penaltyZeroPts(false);
      currentPenaltyStatus
          .penaltyMinusTwoPts(!currentPenaltyStatus.penaltyMinusTwoPts.value);
      currentPenaltyStatus.penaltyMaxTwoPts(false);
      currentPenaltyStatus.penaltyMaxFourHalfPts(false);
      currentPenaltyStatus.penaltyMinusHalfToTwoPts(false);
      currentPenaltyStatus.penaltyJudgeOpinion(false);
      break;
    case 2:
      currentPenaltyStatus.penaltyZeroPts(false);
      currentPenaltyStatus.penaltyMinusTwoPts(false);
      currentPenaltyStatus
          .penaltyMaxTwoPts(!currentPenaltyStatus.penaltyMaxTwoPts.value);
      currentPenaltyStatus.penaltyMaxFourHalfPts(false);
      currentPenaltyStatus.penaltyMinusHalfToTwoPts(false);
      currentPenaltyStatus.penaltyJudgeOpinion(false);
      break;
    case 3:
      currentPenaltyStatus.penaltyZeroPts(false);
      currentPenaltyStatus.penaltyMinusTwoPts(false);
      currentPenaltyStatus.penaltyMaxTwoPts(false);
      currentPenaltyStatus.penaltyMaxFourHalfPts(
          !currentPenaltyStatus.penaltyMaxFourHalfPts.value);
      currentPenaltyStatus.penaltyMinusHalfToTwoPts(false);
      currentPenaltyStatus.penaltyJudgeOpinion(false);
      break;
    case 4:
      currentPenaltyStatus.penaltyZeroPts(false);
      currentPenaltyStatus.penaltyMinusTwoPts(false);
      currentPenaltyStatus.penaltyMaxTwoPts(false);
      currentPenaltyStatus.penaltyMaxFourHalfPts(false);
      currentPenaltyStatus.penaltyMinusHalfToTwoPts(
          !currentPenaltyStatus.penaltyMinusHalfToTwoPts.value);
      currentPenaltyStatus.penaltyJudgeOpinion(false);
      break;
    case 5:
      currentPenaltyStatus.penaltyZeroPts(false);
      currentPenaltyStatus.penaltyMinusTwoPts(false);
      currentPenaltyStatus.penaltyMaxTwoPts(false);
      currentPenaltyStatus.penaltyMaxFourHalfPts(false);
      currentPenaltyStatus.penaltyMinusHalfToTwoPts(false);
      currentPenaltyStatus
          .penaltyJudgeOpinion(!currentPenaltyStatus.penaltyJudgeOpinion.value);
      break;
    default:
  }
  if (currentPenaltyStatus.userSanctionSelection.value != sanctionID) {
    currentPenaltyStatus.userSanctionSelection(sanctionID);
  } else {
    currentPenaltyStatus.userSanctionSelection(-1);
  }
  //canUserGoNext();
  // buttonPenaltyDebug();
  return currentPenaltyStatus;
}

// Set the penalties and the ownership the the user's response
buttonAllStatusSetToUserAnswer({required int quizIndex}) {
  buttonPenaltyStatusSet(
      sanctionID: currentQuiz.answers[quizIndex].sanctionValue);
  currentPenaltyStatus.ownershipJudge(currentQuiz.answers[quizIndex].judge);
  currentPenaltyStatus.ownershipReferee(currentQuiz.answers[quizIndex].referee);
}

// Log views
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
