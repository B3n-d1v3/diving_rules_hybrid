import 'package:diving_rules_hybrid/models/globals.dart';
import 'package:diving_rules_hybrid/nav_quiz/screen_quiz_question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:get/get.dart';

import '../buttons/quiz_correction_icon.dart';
import '../l10n/language_selector.dart';
import '../l10n/penalty_description_l10n.dart';
import '../models/quiz_button_status.dart';
import '../theme/theme_selector.dart';

//import 'package:get/get.dart';

//import '../models/globals.dart';

class ScreenCorrectionList extends StatefulWidget {
  const ScreenCorrectionList({Key? key}) : super(key: key);

  @override
  State<ScreenCorrectionList> createState() => _ScreenCorrectionListState();
}

class _ScreenCorrectionListState extends State<ScreenCorrectionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.quizzCorrectionListHeader),
          actions: [LanguageSelector(), ThemeSelector()],
        ),
        body: SafeArea(
            child: ListView.builder(
          itemCount: currentQuiz.questions.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: QuizCorrectionIcon(
                      penaltyQuestion: penaltySummary
                          .penalties[currentQuiz.questions[index]],
                      penaltyAnswer: currentQuiz.answers[index],
                      size: 30),
                  title: PenaltyDescription(
                      penaltyId: currentQuiz.questions[index]),
                  //Text(penaltySummary.penalties[index].description, maxLines: 4,),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () {
                    // Reset the current content to the user answer's setup
                    currentQuizQuestionIndex = index + 1;
                    buttonAllStatusSetToUserAnswer(quizIndex: index);
                    // TODO: delete or comment all debugPrints
                    // debugPrint('>>>>> Screen Quiz Correction List > currentQuizQuestionIndex: $currentQuizQuestionIndex');
                    // buttonPenaltyDebug();
                    // buttonOwnershipDebug();

                    Get.to(
                      () => ScreenQuizQuestion(
                          index: currentQuiz.questions[index]),
                      transition: Transition.rightToLeftWithFade,
                      curve: Curves.ease,
                    );
                  },
                ),
                Divider(),
              ],
            );
          },
        )));
  }
}
