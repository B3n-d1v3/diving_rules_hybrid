//import 'package:flutter/cupertino.dart';
import 'package:diving_rules_hybrid/nav_quiz/screen_quiz_correction_list.dart';
import 'package:diving_rules_hybrid/nav_quiz/screen_quiz_question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:get/get.dart';

import '../l10n/action_language_selector.dart';
import '../models/globals.dart';
import '../models/quiz_button_status.dart';
import '../models/quiz_model.dart';
import '../models/token_spacing.dart';
import '../sub_views/action_search.dart';
import '../theme/action_theme_selector.dart';
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
        title: Text(
          AppLocalizations.of(context)!.quizzResultHeader,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [ActionSearch(), LanguageSelector(), ThemeSelector()],
      ),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.all(DRSpacing.l),
              child: Column(
                children: [
                  /// Quiz Question Title
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

                  SizedBox(
                    height: DRSpacing.xl,
                  ),

                  /// Quiz text result description
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

                  SizedBox(
                    height: DRSpacing.x6l,
                  ),

                  /// The Result of the Quiz
                  /// Result Badge

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

                  SizedBox(
                    height: DRSpacing.s,
                  ),

                  /// Quiz result values
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
                        ),
                      ],
                    )),
                  ),

                  SizedBox(
                    height: DRSpacing.s,
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

                  SizedBox(
                    height: DRSpacing.x6l,
                  ),

                  /// Quiz Result footer

                  /// Show correction
                  OutlinedButton.icon(
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
                    label: Text(
                        AppLocalizations.of(context)!.quizzResultReviewButton,
                        style: const TextStyle(
                            fontWeight: FontWeight.w900)), // <-- Text
                  ),

                  SizedBox(
                    height: DRSpacing.xl,
                  ),

                  /// Restart New Quiz
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        backgroundColor: Theme.of(context).colorScheme.primary),
                    onPressed: () {
                      // TODO: Later / Save previous Quiz
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
                    label: Text(
                        AppLocalizations.of(context)!.quizzResultStartButton,
                        style: const TextStyle(
                            fontWeight: FontWeight.w900)), // <-- Text
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
