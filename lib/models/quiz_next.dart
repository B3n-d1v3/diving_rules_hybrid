import 'package:get/get.dart';

import '../models/globals.dart';

canUserGoNext() {
  if (currentPenaltyStatus.userSanctionSelection < 0 &&
      (currentPenaltyStatus.ownershipReferee == true.obs ||
          currentPenaltyStatus.ownershipJudge == true.obs)) {
    currentPenaltyStatus.nextQuestion = true.obs;
  } else {
    currentPenaltyStatus.nextQuestion = false.obs;
  }
}
