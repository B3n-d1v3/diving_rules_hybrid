import 'package:diving_rules_hybrid/nav_quiz/screen_quiz_question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:get/get.dart';

import '../models/globals.dart';
import '../models/quiz_button_status.dart';
import '../models/quiz_model.dart';

class ScreenQuiz extends StatefulWidget {
  ScreenQuiz({Key? key}) : super(key: key);

  @override
  State<ScreenQuiz> createState() => _ScreenQuizState();
}

class _ScreenQuizState extends State<ScreenQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text(AppLocalizations.of(context)!.quizzTitle)),
        body: SafeArea(
            child: Scrollbar(
                child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.all(16),
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
              )),
            ),

            SizedBox(height: 10),

            // Quiz description
            Align(
              alignment: Alignment.topLeft,
              child: Text(AppLocalizations.of(context)!.quizzIntroDescription,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),

            const SizedBox(
              height: 20,
            ),

            Divider(),

            const SizedBox(
              height: 10,
            ),

            // Number of questions selection
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.quizzIntroQuestionNumber,
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(
                    width: 16,
                  ),
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
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                      width: 20,
                      child: Text(
                        quizTotalQuestionNumber.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      )),
                  const SizedBox(
                    width: 8,
                  ),
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
            const SizedBox(
              height: 10,
            ),
            Divider(),

            const SizedBox(
              height: 20,
            ),

            // Start button
            // TODO: dark mode version color is not working
            ElevatedButton.icon(
              onPressed: () {
                currentQuizQuestionIndex = 1;
                newQuiz();
                currentQuizScore = 0;
                buttonStatusReset();
                //debugPrint('>>>>> Screen Quiz > currentQuiz.questions: ${currentQuiz.questions}');
                // Temp list init to test function
                // var testList = newListOfQuestions(nbQuestions: quizTotalQuestionNumber);
                Get.to(
                  ScreenQuizQuestion(),
                  transition: Transition.rightToLeftWithFade,
                  //duration: const Duration(seconds: 1),
                  curve: Curves.ease,
                );
              },
              icon: const Icon(
                CupertinoIcons.play_circle_fill, // envelope_circle
                size: 24.0,
              ),
              label: Text(AppLocalizations.of(context)!
                  .quizzIntroStartButton), // <-- Text
            ),
          ],
        ),
      ),
    ))));
  }
}
