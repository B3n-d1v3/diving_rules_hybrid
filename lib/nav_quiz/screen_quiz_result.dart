//import 'package:flutter/cupertino.dart';
import 'package:diving_rules_hybrid/nav_quiz/screen_quiz_correction_list.dart';
import 'package:diving_rules_hybrid/nav_quiz/screen_quiz_question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:get/get.dart';

import '../models/globals.dart';
import '../models/quiz_button_status.dart';
import '../models/quiz_model.dart';
import '../theme/dr_colors.dart';

class ScreenQuizResult extends StatefulWidget {
  const ScreenQuizResult({Key? key}) : super(key: key);

  @override
  State<ScreenQuizResult> createState() => _ScreenQuizResultState();
}

class _ScreenQuizResultState extends State<ScreenQuizResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.quizzResultHeader),
      ),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  // Quiz Question Title
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                        text: TextSpan(
                      style: Theme.of(context).textTheme.headlineMedium,
                      children: [
                        TextSpan(
                            text:
                                AppLocalizations.of(context)!.quizzResultTitle,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary)),
                      ],
                    )),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                        text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context)!
                              .quizzResultDescription,
                        ),
                      ],
                    )),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // The Result of the Quiz

                  const SizedBox(
                    height: 20,
                  ),

                  // Result Badge

                  (currentQuizScore >= quizTotalQuestionNumber * 8)
                      ? Icon(
                          CupertinoIcons.checkmark_shield_fill,
                          size: 100.0,
                          color: Get.isDarkMode
                              ? AppColor.drColorPositiveDark
                              : AppColor.drColorPositiveLight,
                        )
                      : Icon(
                          CupertinoIcons.xmark_shield_fill,
                          size: 100.0,
                          color: Get.isDarkMode
                              ? AppColor.drColorNegativeDark
                              : AppColor.drColorNegativeLight,
                        ),

                  const SizedBox(
                    height: 10,
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                        text: TextSpan(
                      style: Theme.of(context).textTheme.headlineSmall,
                      children: [
                        TextSpan(
                          text:
                              '${(currentQuizScore * 10 / quizTotalQuestionNumber).toInt()}%',
                        ),
                      ],
                    )),
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                        text: TextSpan(
                      style: Theme.of(context).textTheme.headlineSmall,
                      children: [
                        TextSpan(
                          text:
                              (currentQuizScore >= quizTotalQuestionNumber * 8)
                                  ? AppLocalizations.of(context)!.passed
                                  : AppLocalizations.of(context)!.failed,
                          //style: TextStyle(color: Theme.of(context).colorScheme.primary)
                        ),
                      ],
                    )),
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                        text: TextSpan(
                      style: Theme.of(context).textTheme.bodySmall,
                      children: [
                        TextSpan(
                            text:
                                '($currentQuizScore pts / max  ${quizTotalQuestionNumber * 10} pts)',
                            style: TextStyle(
                                color: Get.isDarkMode
                                    ? AppColor.drColorDeselectedDark
                                    : AppColor.drColorDeselectedLight)),
                      ],
                    )),
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  // Quiz Result footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Show correction
                      ElevatedButton.icon(
                        onPressed: () {
                          // debugPrint('>>>>> Quiz Result Page > currentQuiz.questions: ${currentQuiz.questions}');

                          Get.to(
                            () => ScreenCorrectionList(),
                            transition: Transition.rightToLeftWithFade,
                            curve: Curves.ease,
                          );
                        },
                        icon: const Icon(
                          CupertinoIcons.eye, // envelope_circle
                          size: 24.0,
                        ),
                        label: Text(AppLocalizations.of(context)!
                            .quizzResultReviewButton), // <-- Text
                      ),

                      // Restart New Quiz
                      ElevatedButton.icon(
                        onPressed: () {
                          // TODO: Save previous Quiz
                          currentQuizQuestionIndex = 1;
                          newQuiz();
                          currentQuizScore = 0;
                          buttonStatusReset();

                          Get.off(
                            () => ScreenQuizQuestion(),
                            transition: Transition.rightToLeftWithFade,
                            curve: Curves.ease,
                          );
                        },
                        icon: const Icon(
                          CupertinoIcons.play_circle_fill, // envelope_circle
                          size: 24.0,
                        ),
                        label: Text(AppLocalizations.of(context)!
                            .quizzResultStartButton), // <-- Text
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
