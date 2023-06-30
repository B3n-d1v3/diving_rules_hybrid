//import 'package:flutter/cupertino.dart';
import 'package:diving_rules_hybrid/nav_quiz/screen_quiz_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:get/get.dart';

import '../buttons/button_ownership.dart';
import '../buttons/button_penalties.dart';
import '../l10n/penalty_description_l10n.dart';
import '../models/globals.dart';
import '../models/quiz_button_status.dart';
import '../models/quiz_model.dart';
import '../models/quiz_score.dart';
import '../theme/dr_colors.dart';

class ScreenQuizQuestion extends StatefulWidget {
//testing Getx controller  < did not work this way
  int index;

  ScreenQuizQuestion({Key? key, this.index = -1}) : super(key: key);

  // index argument usage
  // if (widget.index != -1) then the widget will display a quiz correction
  // if ( widget.index == -1) then the widget will display a quiz question

  // Testing Getx controller
  // final currentPenaltyStatus = Get.put(ButtonsStatus());

  @override
  State<ScreenQuizQuestion> createState() => _ScreenQuizQuestionState();
}

class _ScreenQuizQuestionState extends State<ScreenQuizQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.quizzQuestionHeader),
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
                            text: AppLocalizations.of(context)!.quizzQuestion,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary)
                            // style: Theme.of(context).textTheme.headlineMedium,
                            ),
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

                  // The Penalty Question Body

                  SizedBox(height: 10),

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
                                color: Theme.of(context).colorScheme.primary)
                            // style: Theme.of(context).textTheme.titleLarge,
                            ),
                      ],
                    )),
                  ),

                  // Description Content
                  Align(
                    alignment: Alignment.centerLeft,
                    child: PenaltyDescription(
                        penaltyId: currentQuiz
                            .questions[currentQuizQuestionIndex - 1]),
                    // Text(penaltySummary.penalties[widget.index].description, style: Theme.of(context).textTheme.bodyLarge),
                  ),

                  SizedBox(height: 10),

                  // // Rules References
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: DisplayRulesReferences(
                  //       rulesReferences:
                  //       penaltySummary.penalties[currentQuiz.questions[currentQuizQuestionIndex-1]].rules),
                  // ),

                  const Divider(
                    height: 20,
                    thickness: .5,
                    indent: 10,
                    endIndent: 10,
                    color: AppColor.drColorDeselectedLight,
                  ),

                  // Penalty Sanction
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
                                color: Theme.of(context).colorScheme.primary)
                            // style: Theme.of(context).textTheme.titleLarge,
                            ),
                      ],
                    )),
                  ),
                  SizedBox(height: 10),

                  // GridView to display the Penalty Sanctions
                  GridView.count(
                    crossAxisCount: 3,
                    primary: false,
                    padding: const EdgeInsets.all(1),
                    childAspectRatio: (1 / .8),
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: <Widget>[
                      PenaltyButton(
                          buttonType: 0,
                          viewInQuiz: true,
                          penaltyIndex: widget.index,
                          viewCorrection: widget.index != -1),
                      PenaltyButton(
                          buttonType: 2,
                          viewInQuiz: true,
                          penaltyIndex: widget.index,
                          viewCorrection: widget.index != -1),
                      PenaltyButton(
                          buttonType: 3,
                          viewInQuiz: true,
                          penaltyIndex: widget.index,
                          viewCorrection: widget.index != -1),
                      PenaltyButton(
                          buttonType: 1,
                          viewInQuiz: true,
                          penaltyIndex: widget.index,
                          viewCorrection: widget.index != -1),
                      PenaltyButton(
                          buttonType: 4,
                          viewInQuiz: true,
                          penaltyIndex: widget.index,
                          viewCorrection: widget.index != -1),
                      PenaltyButton(
                          buttonType: 5,
                          viewInQuiz: true,
                          penaltyIndex: widget.index,
                          viewCorrection: widget.index != -1),
                    ],
                  ),

                  const Divider(
                    height: 10,
                    thickness: .5,
                    indent: 10,
                    endIndent: 10,
                    color: AppColor.drColorDeselectedLight,
                  ),

                  // Penalty ownership
                  // Penalty Title
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
                                color: Theme.of(context).colorScheme.primary)
                            // style: Theme.of(context).textTheme.titleLarge,
                            ),
                      ],
                    )),
                  ),

                  SizedBox(height: 10),

                  // GridView to display the Penalty Owners
                  GridView.count(
                    crossAxisCount: 2,
                    primary: false,
                    padding: const EdgeInsets.all(1),
                    childAspectRatio: (1 / .6),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 0,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: <Widget>[
                      OwnershipButton(
                          buttonType: 0,
                          viewInQuiz: true,
                          penaltyIndex: widget.index,
                          viewCorrection: widget.index != -1),
                      OwnershipButton(
                          buttonType: 1,
                          viewInQuiz: true,
                          penaltyIndex: widget.index,
                          viewCorrection: widget.index != -1),
                    ],
                  ),

                  // The Footer
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(),

                  const SizedBox(
                    height: 20,
                  ),

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
                            // Next button
                            // TODO: CURRENT >>> render button inactive when Next question is not active
                            ElevatedButton.icon(
                              onPressed:
                                  // TODO: CURRENT >>> debug the button to turn back on
                                  // currentQuizNextQuestion

                                  // Show next question only if (user selected one penalty) & (user selected at least one ownership)
                                  //     currentPenaltyStatus.nextQuestion.value == true
                                  //         ?
                                  () {
                                // Log the user answer
                                logUserAnswer();
                                debugPrint(
                                    '>>>>> Screen Quiz Question > currentQuizQuestionIndex: $currentQuizQuestionIndex');
                                debugPrint(
                                    '>>>>> Screen Quiz Question > penaltyQuestion: penaltySummary.penalties[currentQuiz.questions[currentQuizQuestionIndex - 1]].id: ${penaltySummary.penalties[currentQuiz.questions[currentQuizQuestionIndex - 1]].id}');
                                debugPrint(
                                    '>>>>> Screen Quiz Question > penaltyAnswer: currentQuiz.answers[currentQuizQuestionIndex - 1].id: ${currentQuiz.answers[currentQuizQuestionIndex - 1].id}');

                                // Score Incrementation
                                currentQuizScore += userAnswerAnalysis(
                                    penaltyQuestion: penaltySummary.penalties[
                                        currentQuiz.questions[
                                            currentQuizQuestionIndex - 1]],
                                    penaltyAnswer: currentQuiz
                                        .answers[currentQuizQuestionIndex - 1],
                                    score: true);

                                // Reset for next Question
                                buttonStatusReset();
                                // userAnswerDebug(index: currentQuizQuestionIndex - 1);

                                // The user will get access to the next question
                                if (currentQuizQuestionIndex <
                                    quizTotalQuestionNumber) {
                                  setState(() {
                                    currentQuizQuestionIndex += 1;
                                    debugPrint(
                                        '>>>>> Screen Quiz Question > currentQuizQuestionIndex (in next question): $currentQuizQuestionIndex < quizTotalQuestionNumber: $quizTotalQuestionNumber');
                                  });
                                  // Last Question and the user will get access to the quiz result page
                                } else {
                                  // Get.to(
                                  Get.off(
                                    ScreenQuizResult(),
                                    transition: Transition.rightToLeftWithFade,
                                  );
                                }
                              }
                              // Show next question only if - otherwise disable it
                              //         : null,
                              ,
                              icon: const Icon(
                                CupertinoIcons.greaterthan_circle_fill,
                                // envelope_circle
                                size: 24.0,
                              ),
                              label: Text(AppLocalizations.of(context)!
                                  .quizzNext), // <-- Text
                            ),
                          ],
                        )
                      // Case when the page shows the correction
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                              // Correction Legend
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
