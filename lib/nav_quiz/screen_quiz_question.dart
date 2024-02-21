//import 'package:flutter/cupertino.dart';
import 'package:diving_rules_hybrid/nav_quiz/screen_quiz_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:get/get.dart';

import '../buttons/button_ownership.dart';
import '../buttons/button_penalties.dart';
import '../l10n/action_language_selector.dart';
import '../l10n/penalty_description_l10n.dart';
import '../models/globals.dart';
import '../models/quiz_button_status.dart';
import '../models/quiz_model.dart';
import '../models/quiz_score.dart';
import '../models/token_spacing.dart';
import '../sub_views/action_search.dart';
import '../theme/action_theme_selector.dart';
import '../theme/dr_colors.dart';

class ScreenQuizQuestion extends StatefulWidget {
  int index;

  ScreenQuizQuestion({Key? key, this.index = -1}) : super(key: key);

  // index argument usage
  // if (widget.index != -1) then the widget will display a quiz correction
  // if ( widget.index == -1) then the widget will display a quiz question

  @override
  State<ScreenQuizQuestion> createState() => _ScreenQuizQuestionState();
}

class _ScreenQuizQuestionState extends State<ScreenQuizQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.quizzQuestionHeader,
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
                            text: AppLocalizations.of(context)!.quizzQuestion,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary)),
                        (widget.index == -1)
                            ? TextSpan(
                                text:
                                    ' $currentQuizQuestionIndex/$quizTotalQuestionNumber',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary))
                            : const TextSpan(text: ''),
                      ],
                    )),
                  ),

                  /// The Penalty Question Body

                  SizedBox(height: DRSpacing.s),

                  /// Description
                  // Description Title
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                        text: TextSpan(
                      style: Theme.of(context).textTheme.titleLarge,
                      children: [
                        TextSpan(
                            text: AppLocalizations.of(context)!
                                .penaltyDescription,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary)),
                      ],
                    )),
                  ),

                  // Description Content
                  Align(
                    alignment: Alignment.centerLeft,
                    child: PenaltyDescription(
                        penaltyId: currentQuiz
                            .questions[currentQuizQuestionIndex - 1]),
                  ),

                  SizedBox(height: DRSpacing.s),

                  Divider(
                    height: DRSpacing.l,
                    thickness: .5,
                    indent: DRSpacing.s,
                    endIndent: DRSpacing.s,
                    color: AppColor.drColorDeselectedLight,
                  ),

                  /// Penalty Sanction
                  // Penalty Title
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                        text: TextSpan(
                      style: Theme.of(context).textTheme.titleLarge,
                      children: [
                        TextSpan(
                            text: AppLocalizations.of(context)!.penaltyPenalty,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary)),
                      ],
                    )),
                  ),

                  SizedBox(height: DRSpacing.xs),

                  // Penalty Sanctions options
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.top,
                    defaultColumnWidth: const FlexColumnWidth(1.0),
                    children: [
                      TableRow(children: [
                        PenaltyButton(
                          buttonType: 0,
                          penaltyIndex: widget.index,
                          viewMode: (widget.index == -1) ? 1 : 2,
                        ),
                        PenaltyButton(
                          buttonType: 2,
                          penaltyIndex: widget.index,
                          viewMode: (widget.index == -1) ? 1 : 2,
                        ),
                        PenaltyButton(
                          buttonType: 3,
                          penaltyIndex: widget.index,
                          viewMode: (widget.index == -1) ? 1 : 2,
                        ),
                      ]),
                      TableRow(children: [
                        PenaltyButton(
                          buttonType: 1,
                          penaltyIndex: widget.index,
                          viewMode: (widget.index == -1) ? 1 : 2,
                        ),
                        PenaltyButton(
                          buttonType: 4,
                          penaltyIndex: widget.index,
                          viewMode: (widget.index == -1) ? 1 : 2,
                        ),
                        PenaltyButton(
                          buttonType: 5,
                          penaltyIndex: widget.index,
                          viewMode: (widget.index == -1) ? 1 : 2,
                        ),
                      ])
                    ],
                  ),

                  Divider(
                    height: DRSpacing.s,
                    thickness: .5,
                    indent: DRSpacing.s,
                    endIndent: DRSpacing.s,
                    color: AppColor.drColorDeselectedLight,
                  ),

                  /// Penalty ownership
                  // Ownership Title
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                        text: TextSpan(
                      style: Theme.of(context).textTheme.titleLarge,
                      children: [
                        TextSpan(
                            text:
                                AppLocalizations.of(context)!.penaltyOwnership,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary)),
                      ],
                    )),
                  ),

                  SizedBox(height: DRSpacing.xs),

                  // Ownership options
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.top,
                    defaultColumnWidth: const FlexColumnWidth(1.0),
                    children: [
                      TableRow(children: [
                        OwnershipButton(
                          buttonType: 0,
                          penaltyIndex: widget.index,
                          viewMode: (widget.index == -1) ? 1 : 2,
                        ),
                        OwnershipButton(
                          buttonType: 1,
                          penaltyIndex: widget.index,
                          viewMode: (widget.index == -1) ? 1 : 2,
                        ),
                      ]),
                    ],
                  ),

                  /// The Footer
                  Divider(
                    height: DRSpacing.l,
                    thickness: .5,
                    indent: DRSpacing.s,
                    endIndent: DRSpacing.s,
                    color: AppColor.drColorDeselectedLight,
                  ),

                  SizedBox(height: DRSpacing.s),

                  (widget.index == -1)
                      // Case when the page shows the question
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // User Score
                            RichText(
                                text: TextSpan(
                              style: Theme.of(context).textTheme.labelSmall,
                              children: [
                                TextSpan(
                                    text: '${currentQuizScore} pts',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary)),
                              ],
                            )),

                            const Expanded(child: Text('')),

                            /// Next button
                            // TODO Later: Identify where to update the obx observer to show/hide button
                            // was temporarily resolved with a snackbar message
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      Theme.of(context).colorScheme.onPrimary,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary),

                              onPressed:
                                  // beginning on pressed
                                  // Show next question only if (user selected one penalty) & (user selected at least one ownership)
                                  () {
                                if (currentPenaltyStatus.nextQuestion.value ==
                                    true) {
                                  // Log the user answer
                                  logUserAnswer();

                                  // Score Incrementation
                                  currentQuizScore += userAnswerAnalysis(
                                      penaltyQuestion: penaltySummary.penalties[
                                          currentQuiz.questions[
                                              currentQuizQuestionIndex - 1]],
                                      penaltyAnswer: currentQuiz.answers[
                                          currentQuizQuestionIndex - 1],
                                      score: true);

                                  // Reset for next Question
                                  buttonStatusReset();
                                  // userAnswerDebug(index: currentQuizQuestionIndex - 1);

                                  // The user will get access to the next question
                                  if (currentQuizQuestionIndex <
                                      quizTotalQuestionNumber) {
                                    setState(() {
                                      currentQuizQuestionIndex += 1;
                                      // debugPrint('>>>>> Screen Quiz Question > currentQuizQuestionIndex (in next question): $currentQuizQuestionIndex < quizTotalQuestionNumber: $quizTotalQuestionNumber');
                                    });
                                  } else {
                                    // Last Question and the user will get access to the quiz result page
                                    Get.off(
                                      () => ScreenQuizResult(),
                                      transition:
                                          Transition.rightToLeftWithFade,
                                      curve: Curves.ease,
                                    );
                                  }
                                } else {
                                  // otherwise (if !((user selected one penalty) & (user selected at least one ownership))) warn the user with scnackbar
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(AppLocalizations.of(context)!
                                        .quizzQuestionWarningNext),
                                  ));
                                }
                              }, // onPressed

                              icon: const Icon(
                                CupertinoIcons.greaterthan_circle_fill,
                                // envelope_circle
                                size: 24.0,
                              ),

                              label: Text(
                                  AppLocalizations.of(context)!.quizzNext,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900)),
                            ),
                            // ),   // <- Obx
                          ],
                        )
                      // Case when the page shows the correction
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                              /// Correction Legend
                              // unselected
                              RichText(
                                  text: TextSpan(
                                style: Theme.of(context).textTheme.labelMedium,
                                children: [
                                  TextSpan(
                                      text: AppLocalizations.of(context)!
                                          .quizzResultLegendUnused,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary)),
                                ],
                              )),

                              // User response
                              RichText(
                                  text: TextSpan(
                                style: Theme.of(context).textTheme.labelMedium,
                                children: [
                                  TextSpan(
                                      text: AppLocalizations.of(context)!
                                          .quizzResultLegendUserAnswer,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                                ],
                              )),

                              // Correct answer
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                    border: Border.all(
                                      width: 2,
                                      color: Get.isDarkMode
                                          ? AppColor.drColorPositiveDark
                                          : AppColor.drColorPositiveLight,
                                    )),
                                child: RichText(
                                    text: TextSpan(
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                  children: [
                                    TextSpan(
                                        text: AppLocalizations.of(context)!
                                            .quizzResultLegendRealAnswer),
                                  ],
                                )),
                              ),
                            ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
