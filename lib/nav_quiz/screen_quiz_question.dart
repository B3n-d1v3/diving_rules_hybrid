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
import '../theme/dr_colors.dart';

class ScreenQuizQuestion extends StatefulWidget {
//testing Getx controller  < did not work this way
// class ScreenQuizQuestion extends GetView<HomeController> {
  ScreenQuizQuestion({Key? key}) : super(key: key);

  // Testing Getx controller
  // final currentPenaltyStatus = Get.put(ButtonsStatus());

  @override
  State<ScreenQuizQuestion> createState() => _ScreenQuizQuestionState();
}

class _ScreenQuizQuestionState extends State<ScreenQuizQuestion> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
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
                                text:
                                    AppLocalizations.of(context)!.quizzQuestion,
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary)
                                // style: Theme.of(context).textTheme.headlineMedium,
                                ),
                            TextSpan(
                                text:
                                    ' $currentQuizQuestionIndex/$quizTotalQuestionNumber',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
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
                                    color:
                                        Theme.of(context).colorScheme.primary)
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
                                text: AppLocalizations.of(context)!
                                    .penaltyPenalty,
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary)
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
                        childAspectRatio: (1 / .7),
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: <Widget>[
                          PenaltyButton(
                              buttonType: 0,
                              isSelected:
                                  currentPenaltyStatus.penaltyZeroPts.value),
                          PenaltyButton(
                              buttonType: 1,
                              isSelected:
                                  currentPenaltyStatus.penaltyMaxTwoPts.value),
                          PenaltyButton(
                              buttonType: 2,
                              isSelected: currentPenaltyStatus
                                  .penaltyMaxFourHalfPts.value),
                          PenaltyButton(
                              buttonType: 3,
                              isSelected: currentPenaltyStatus
                                  .penaltyMinusTwoPts.value),
                          PenaltyButton(
                              buttonType: 4,
                              isSelected: currentPenaltyStatus
                                  .penaltyMinusHalfToTwoPts.value),
                          PenaltyButton(
                              buttonType: 5,
                              isSelected: currentPenaltyStatus
                                  .penaltyJudgeOpinion.value),
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
                                text: AppLocalizations.of(context)!
                                    .penaltyOwnership,
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary)
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
                        childAspectRatio: (1 / .7),
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: <Widget>[
                          OwnershipButton(buttonType: 0, viewInQuiz: true),
                          OwnershipButton(buttonType: 1, viewInQuiz: true),
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

                      // Next button
                      // TODO: dark mode version color is not working
                      ElevatedButton.icon(
                        onPressed: () {
                          // Log the user answer
                          debugPrint(
                              '>>>>> Screen Quiz Question > currentQuizQuestionIndex: $currentQuizQuestionIndex');
                          logUserAnswer();
                          // Reset for next Question
                          buttonStatusReset();
                          // userAnswerDebug(index: currentQuizQuestionIndex - 1);
                          // The user will get access to the next question
                          if (currentQuizQuestionIndex <
                              quizTotalQuestionNumber) {
                            setState(() {
                              currentQuizQuestionIndex += 1;
                              debugPrint(
                                  '>>>>> Screen Quiz Question > currentQuizQuestionIndex (in next question): $currentQuizQuestionIndex');
                              debugPrint(
                                  '>>>>> Screen Quiz Question > quizTotalQuestionNumber: $quizTotalQuestionNumber');
                            });
                            // Last Question and the user will get access to the quiz result page
                          } else {
                            // Get.to(
                            Get.off(
                              ScreenQuizResult(),
                              transition: Transition.rightToLeftWithFade,
                            );
                          }
                        },
                        icon: const Icon(
                          CupertinoIcons
                              .greaterthan_circle_fill, // envelope_circle
                          size: 24.0,
                        ),
                        label: Text(AppLocalizations.of(context)!
                            .quizzNext), // <-- Text
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
