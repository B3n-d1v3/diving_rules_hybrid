import 'package:flutter/material.dart';

import 'globals.dart';

// Question page - buttons model for view
class ButtonsStatus {
  // penalty buttons status
  bool penaltyZeroPts = false;
  bool penaltyMaxTwoPts = false;
  bool penaltyMaxFourHalfPts = false;
  bool penaltyMinusTwoPts = false;
  bool penaltyMinusHalfToTwoPts = false;
  bool penaltyJudgeOpinion = false;

  // ownership buttons status
  bool ownershipReferee = false;
  bool ownershipJudge = false;

  // Other data needed
  // Sanction set by the user
  int userSanctionSelection = 500;

  // has the user answered enough elements to go to the next question (one sanction and at least one owner)
  bool nextQuestion = false;
}

// Reset the current question status display model
ButtonsStatus buttonStatusReset() {
  ButtonsStatus buttonsTemp = ButtonsStatus();
  // Reset the current question status display model
  // buttonsTemp.penaltyZeroPts = false;
  // buttonsTemp.penaltyMaxTwoPts = false;
  // buttonsTemp.penaltyMaxFourHalfPts = false;
  // buttonsTemp.penaltyMinusTwoPts = false;
  // buttonsTemp.penaltyMinusHalfToTwoPts = false;
  // buttonsTemp.penaltyJudgeOpinion = false;
  //
  // buttonsTemp.ownershipReferee = false;
  // buttonsTemp.ownershipJudge = false;
  //
  // buttonsTemp.nextQuestion = false;
  // buttonsTemp.userSanctionSelection = 400;

  return buttonsTemp;
}

// Set the ButtonsStatus Object to the penalty's status display model
// This is used by the error review page to set the data display model to the penalty's reference sanction & ownership
buttonAllStatusSet({required int penaltyNb}) {
  buttonPenaltyStatusSet(
      sanctionID: penaltySummary.penalties[penaltyNb].sanctionValue);

  penaltyButtonStatus.ownershipJudge =
      penaltySummary.penalties[penaltyNb].judge;
  penaltyButtonStatus.ownershipReferee =
      penaltySummary.penalties[penaltyNb].referee;
}

buttonPenaltyStatusSet({required int sanctionID}) {
  //int sanctionID = penaltySummary.penalties[penaltyNb].sanctionValue;
  if (sanctionID == 0) {
    penaltyButtonStatus.penaltyZeroPts = true;
  } else {
    penaltyButtonStatus.penaltyZeroPts = false;
  }
  if (sanctionID == 1) {
    penaltyButtonStatus.penaltyMaxTwoPts = true;
  } else {
    penaltyButtonStatus.penaltyMaxTwoPts = false;
  }
  if (sanctionID == 2) {
    penaltyButtonStatus.penaltyMaxFourHalfPts = true;
  } else {
    penaltyButtonStatus.penaltyMaxFourHalfPts = false;
  }
  if (sanctionID == 3) {
    penaltyButtonStatus.penaltyMinusTwoPts = true;
  } else {
    penaltyButtonStatus.penaltyMinusTwoPts = false;
  }
  if (sanctionID == 4) {
    penaltyButtonStatus.penaltyMinusHalfToTwoPts = true;
  } else {
    penaltyButtonStatus.penaltyMinusHalfToTwoPts = false;
  }
  if (sanctionID == 5) {
    penaltyButtonStatus.penaltyJudgeOpinion = true;
  } else {
    penaltyButtonStatus.penaltyJudgeOpinion = false;
  }
}

buttonPenaltyStatusChange({required int sanctionID}) {
  switch (sanctionID) {
    case 0:
      penaltyButtonStatus.penaltyZeroPts = !penaltyButtonStatus.penaltyZeroPts;
      penaltyButtonStatus.penaltyMaxTwoPts = false;
      penaltyButtonStatus.penaltyMaxFourHalfPts = false;
      penaltyButtonStatus.penaltyMinusTwoPts = false;
      penaltyButtonStatus.penaltyMinusHalfToTwoPts = false;
      penaltyButtonStatus.penaltyJudgeOpinion = false;
      break;
    case 1:
      penaltyButtonStatus.penaltyZeroPts = false;
      penaltyButtonStatus.penaltyMaxTwoPts =
          !penaltyButtonStatus.penaltyMaxTwoPts;
      penaltyButtonStatus.penaltyMaxFourHalfPts = false;
      penaltyButtonStatus.penaltyMinusTwoPts = false;
      penaltyButtonStatus.penaltyMinusHalfToTwoPts = false;
      penaltyButtonStatus.penaltyJudgeOpinion = false;
      break;
    case 2:
      penaltyButtonStatus.penaltyZeroPts = false;
      penaltyButtonStatus.penaltyMaxTwoPts = false;
      penaltyButtonStatus.penaltyMaxFourHalfPts =
          !penaltyButtonStatus.penaltyMaxFourHalfPts;
      penaltyButtonStatus.penaltyMinusTwoPts = false;
      penaltyButtonStatus.penaltyMinusHalfToTwoPts = false;
      penaltyButtonStatus.penaltyJudgeOpinion = false;
      break;
    case 3:
      penaltyButtonStatus.penaltyZeroPts = false;
      penaltyButtonStatus.penaltyMaxTwoPts = false;
      penaltyButtonStatus.penaltyMaxFourHalfPts = false;
      penaltyButtonStatus.penaltyMinusTwoPts =
          !penaltyButtonStatus.penaltyMinusTwoPts;
      penaltyButtonStatus.penaltyMinusHalfToTwoPts = false;
      penaltyButtonStatus.penaltyJudgeOpinion = false;
      break;
    case 4:
      penaltyButtonStatus.penaltyZeroPts = false;
      penaltyButtonStatus.penaltyMaxTwoPts = false;
      penaltyButtonStatus.penaltyMaxFourHalfPts = false;
      penaltyButtonStatus.penaltyMinusTwoPts = false;
      penaltyButtonStatus.penaltyMinusHalfToTwoPts =
          !penaltyButtonStatus.penaltyMinusHalfToTwoPts;
      penaltyButtonStatus.penaltyJudgeOpinion = false;
      break;
    case 5:
      penaltyButtonStatus.penaltyZeroPts = false;
      penaltyButtonStatus.penaltyMaxTwoPts = false;
      penaltyButtonStatus.penaltyMaxFourHalfPts = false;
      penaltyButtonStatus.penaltyMinusTwoPts = false;
      penaltyButtonStatus.penaltyMinusHalfToTwoPts = false;
      penaltyButtonStatus.penaltyJudgeOpinion =
          !penaltyButtonStatus.penaltyJudgeOpinion;
      break;
    default:
  }
  return penaltyButtonStatus;
}

buttonPenaltyDebug() {
  debugPrint('>>>>> Quiz Button Status > penaltyButtonStatus ---:');
  debugPrint(
      '>>>>> Quiz Button Status > penaltyButtonStatus.penaltyZeroPts: ${penaltyButtonStatus.penaltyZeroPts}');
  debugPrint(
      '>>>>> Quiz Button Status > penaltyButtonStatus.penaltyMaxTwoPts: ${penaltyButtonStatus.penaltyMaxTwoPts}');
  debugPrint(
      '>>>>> Quiz Button Status > penaltyButtonStatus.penaltyMaxFourHalfPts: ${penaltyButtonStatus.penaltyMaxFourHalfPts}');
  debugPrint(
      '>>>>> Quiz Button Status > penaltyButtonStatus.penaltyMinusTwoPts: ${penaltyButtonStatus.penaltyMinusTwoPts}');
  debugPrint(
      '>>>>> Quiz Button Status > penaltyButtonStatus.penaltyMinusHalfToTwoPts: ${penaltyButtonStatus.penaltyMinusHalfToTwoPts}');
  debugPrint(
      '>>>>> Quiz Button Status > penaltyButtonStatus.penaltyJudgeOpinion: ${penaltyButtonStatus.penaltyJudgeOpinion}');
}
