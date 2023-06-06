import 'package:diving_rules_hybrid/models/penalty_model.dart';

int userAnswerAnalysis(
    {required Penalty penaltyQuestion,
    required Penalty penaltyAnswer,
    bool score = false}) {
  int result = 0;
  // if the answer is correct
  if (penaltyQuestion.sanctionValue == penaltyAnswer.sanctionValue) {
    // correct penalty sanction
    if ((penaltyQuestion.referee == penaltyAnswer.referee) &&
        (penaltyQuestion.judge == penaltyAnswer.judge)) {
      //correct penalty ownership
      // icon OK
      if (score) {
        result = 10;
      } else {
        result = 0;
      }
    } else if ((penaltyQuestion.referee == penaltyAnswer.referee) ||
        (penaltyQuestion.judge == penaltyAnswer.judge)) {
      // case only one of two ownership
      // icon partial
      if (score) {
        result = 5;
      } else {
        result = 2;
      }
    } else {
      // wrong ownership
      // icon wrong
      if (score) {
        result = 0;
      } else {
        result = 1;
      }
    }
  } else {
    // icon wrong
    if (score) {
      result = 0;
    } else {
      result = 1;
    }
  }
  return result;
}

// Returned status
// - 0 > ok
// - 1 > wrong
// - 2 > partial
