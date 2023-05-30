//import 'package:flutter/cupertino.dart';
import 'package:diving_rules_hybrid/nav_quiz/screen_quiz_question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:get/get.dart';

import '../models/globals.dart';

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
                                color: Theme.of(context).colorScheme.primary)
                            // style: Theme.of(context).textTheme.headlineMedium,
                            ),
                      ],
                    )),
                  ),

                  // The rest

                  // Quiz Restart
                  ElevatedButton.icon(
                    onPressed: () {
                      currentQuizQuestionIndex = 1;
                      Get.to(
                        // Restart New Quiz
                        // Re-init Quiz
                        ScreenQuizQuestion(),
                        transition: Transition.rightToLeftWithFade,
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
            ),
          ),
        ),
      ),
    );
  }
}
