import 'package:diving_rules_hybrid/models/penalty_model.dart';
import 'package:diving_rules_hybrid/theme/dr_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/quiz_score.dart';

class QuizCorrectionIcon extends StatefulWidget {
  Penalty penaltyQuestion;
  Penalty penaltyAnswer;
  double size;

  QuizCorrectionIcon(
      {required this.penaltyQuestion,
      required this.penaltyAnswer,
      required this.size});

  @override
  _QuizCorrectionIconState createState() => _QuizCorrectionIconState();
}

class _QuizCorrectionIconState extends State<QuizCorrectionIcon> {
  @override
  Widget build(BuildContext context) {
    // Debug this function
    // debugPrint('>>>>> QuizCorrectionIcon > penaltyQuestion.id: ${widget.penaltyQuestion.id}');
    // debugPrint('>>>>> QuizCorrectionIcon > penaltyQuestion.sanctionValue: ${widget.penaltyQuestion.sanctionValue} // penaltyAnswer.sanctionValue: ${widget.penaltyAnswer.sanctionValue}');
    // debugPrint('>>>>> QuizCorrectionIcon > penaltyQuestion.referee: ${widget.penaltyQuestion.referee} // penaltyAnswer.referee: ${widget.penaltyAnswer.referee}');
    // debugPrint('>>>>> QuizCorrectionIcon > penaltyQuestion.judge: ${widget.penaltyQuestion.judge} // penaltyAnswer.judge: ${widget.penaltyAnswer.judge}');

    switch (userAnswerAnalysis(
        penaltyQuestion: widget.penaltyQuestion,
        penaltyAnswer: widget.penaltyAnswer)) {
      case 0: // good
        return Icon(
          CupertinoIcons.checkmark_circle_fill,
          size: widget.size,
          color: Get.isDarkMode
              ? AppColor.drColorPositiveDark
              : AppColor.drColorPositiveLight,
        );
        break;
      case 1: // wrong
        return Icon(
          CupertinoIcons.xmark_circle_fill,
          size: widget.size,
          color: Get.isDarkMode
              ? AppColor.drColorNegativeDark
              : AppColor.drColorNegativeLight,
        );
        break;
      case 2: // partial
        return Icon(
          CupertinoIcons.exclamationmark_circle_fill,
          size: widget.size,
          color: Get.isDarkMode
              ? AppColor.drColorWarningDark
              : AppColor.drColorWarningLight,
        );
        break;
      default:
        return Text(' ');
    }
  }
}

// Icons:
// - 0 > ok: checkmark_circle_fill
// - 1 > wrong: xmark_circle_fill
// - 2 > partial: exclamationmark_circle_fill
