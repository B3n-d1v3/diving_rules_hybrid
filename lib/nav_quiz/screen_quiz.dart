import 'package:diving_rules_hybrid/nav_quiz/screen_quiz_question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:get/get.dart';

import 'package:diving_rules_hybrid/models/globals.dart';
import '../models/quiz_button_status.dart';
import '../models/quiz_model.dart';
import '../models/token_spacing.dart';

class ScreenQuiz extends StatefulWidget {
  ScreenQuiz({Key? key}) : super(key: key);

  @override
  State<ScreenQuiz> createState() => _ScreenQuizState();
}

class _ScreenQuizState extends State<ScreenQuiz> {
  @override
  void initState() {
    debugPrint(
        '>>>> ScreenQuiz > initState in > currentPage: "${currentPage}"');
    currentPage = 'quiz';
    // could be 'start', 'rulebook', 'penalties', 'quiz', 'about'
    debugPrint(
        '>>>> ScreenQuiz > initState out > currentPage: "${currentPage}"');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text(AppLocalizations.of(context)!.quizzTitle)),
        body: SafeArea(
            child: Scrollbar(
                child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.all(DRSpacing.l),
        child: Column(
          children: [
            // Quiz Title
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headlineMedium,
                  children: [
                    TextSpan(
                        text: AppLocalizations.of(context)!.quizzIntroTitle,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary)
                        // style: Theme.of(context).textTheme.headlineMedium,
                        ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: DRSpacing.s),

            // Quiz description
            Align(
              alignment: Alignment.topLeft,
              child: Text(AppLocalizations.of(context)!.quizzIntroDescription,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),

            SizedBox(
              height: DRSpacing.xl,
            ),

            Divider(),

            SizedBox(
              height: DRSpacing.s,
            ),

            // Number of questions selection
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)!.quizzIntroQuestionNumber,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.left,
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    iconSize: 34,
                    icon: (quizTotalQuestionNumber > 5)
                        ? Icon(CupertinoIcons.minus_circle_fill)
                        : Icon(CupertinoIcons.minus_circle),
                    tooltip: 'Less',
                    color: (quizTotalQuestionNumber > 5)
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary,
                    onPressed: () {
                      setState(
                        () {
                          if (quizTotalQuestionNumber > 5) {
                            quizTotalQuestionNumber -= 5;
                            // debugPrint(">>> Screen Quiz > Less Questions - questionNumber :$questionNumber");
                          }
                        },
                      );
                    },
                  ),
                  Container(
                      //width: 20,
                      child: Text(
                    quizTotalQuestionNumber.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  )),
                  IconButton(
                    iconSize: 34,
                    icon: (quizTotalQuestionNumber < 40)
                        ? Icon(CupertinoIcons.plus_circle_fill)
                        : Icon(CupertinoIcons.plus_circle),
                    tooltip: 'Less',
                    color: (quizTotalQuestionNumber < 40)
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary,
                    //icon: const Icon(CupertinoIcons.plus_circle),
                    onPressed: () {
                      setState(
                        () {
                          if (quizTotalQuestionNumber < 40) {
                            quizTotalQuestionNumber += 5;
                            // debugPrint(">>> Screen Quiz > Add Questions - questionNumber :$questionNumber");
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: DRSpacing.s,
            ),
            Divider(),

            SizedBox(
              height: DRSpacing.xl,
            ),

            // Start button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.primary),

              onPressed: () {
                currentQuizQuestionIndex = 1;
                newQuiz();
                currentQuizScore = 0;
                buttonStatusReset();
                //debugPrint('>>>>> Screen Quiz > currentQuiz.questions: ${currentQuiz.questions}');

                // Get.to(ScreenQuizQuestion(), transition: Transition.rightToLeftWithFade, curve: Curves.ease,);
                Get.to(
                  () => ScreenQuizQuestion(),
                  transition: Transition.rightToLeftWithFade,
                  curve: Curves.ease,
                );
              },
              icon: const Icon(
                CupertinoIcons.play_circle_fill, // envelope_circle
                size: 24.0,
              ),
              label: Text(AppLocalizations.of(context)!.quizzIntroStartButton,
                  style:
                      const TextStyle(fontWeight: FontWeight.w900)), // <-- Text
            ),
          ],
        ),
      ),
    ))));
  }
}
