//import 'package:flutter/cupertino.dart';
import 'package:diving_rules_hybrid/nav_quiz/screen_quiz_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:get/get.dart';

import '../models/globals.dart';

class ScreenQuizQuestion extends StatefulWidget {
  const ScreenQuizQuestion({Key? key}) : super(key: key);

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
                        TextSpan(
                            text:
                                ' $currentQuizQuestionIndex/$quizzTotalQuestionNumber',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary)),
                      ],
                    )),
                  ),

                  // The rest

                  // Test to go to result page
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
                      if (currentQuizQuestionIndex < quizzTotalQuestionNumber) {
                        // Reset to next Question
                        setState(() {
                          currentQuizQuestionIndex += 1;
                          debugPrint(
                              '>>>>> Screen Quiz Question > currentQuizQuestionIndex: $currentQuizQuestionIndex');
                        });
                      } else {
                        Get.to(
                          ScreenQuizResult(),
                          transition: Transition.rightToLeftWithFade,
                        );
                      }
                    },
                    icon: const Icon(
                      CupertinoIcons.greaterthan_circle_fill, // envelope_circle
                      size: 24.0,
                    ),
                    label: Text(
                        AppLocalizations.of(context)!.quizzNext), // <-- Text
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
