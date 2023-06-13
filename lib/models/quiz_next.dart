import 'package:flutter/material.dart';

import '../models/globals.dart';

canUserGoNext() {
  // debugPrint('>>>>> Quiz Next > currentPenaltyStatus.nextQuestion (before): ${currentPenaltyStatus.nextQuestion}');
  debugPrint(
      '>>>>> Quiz Next > currentQuizNextQuestion (before): ${currentQuizNextQuestion}');
  debugPrint(
      '>>>>> Quiz Next > currentPenaltyStatus.userSanctionSelection: ${currentPenaltyStatus.userSanctionSelection}');
  debugPrint(
      '>>>>> Quiz Next > currentPenaltyStatus.ownershipReferee: ${currentPenaltyStatus.ownershipReferee.value}');
  debugPrint(
      '>>>>> Quiz Next > currentPenaltyStatus.ownershipJudge: ${currentPenaltyStatus.ownershipJudge.value}');

  if (currentPenaltyStatus.userSanctionSelection.value >= 0 &&
      (currentPenaltyStatus.ownershipReferee.value == true ||
          currentPenaltyStatus.ownershipJudge.value == true)) {
    currentQuizNextQuestion = true;
    // currentPenaltyStatus.nextQuestion = true.obs;
  } else {
    currentQuizNextQuestion = false;
    // currentPenaltyStatus.nextQuestion = false.obs;
  }
  debugPrint(
      '>>>>> Quiz Next > currentQuizNextQuestion (before): ${currentQuizNextQuestion}');
  // debugPrint('>>>>> Quiz Next > currentPenaltyStatus.nextQuestion (after): ${currentPenaltyStatus.nextQuestion}');
}
