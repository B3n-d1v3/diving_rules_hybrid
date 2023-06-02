import 'package:diving_rules_hybrid/models/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:get/get.dart';

import '../buttons/quiz_correction_icon.dart';
import '../l10n/penalty_description_l10n.dart';
import '../nav_penalty_list/screen_penalty_details.dart';

//import 'package:get/get.dart';
//import 'package:diving_rules_hybrid/nav_quiz/screen_quiz_correction_details.dart';

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
        ),
        body: SafeArea(
            child: ListView.builder(
          itemCount: currentQuiz.questions.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  // TODO: CURRENT -> debug result page not coherent with the questions answered
                  leading: QuizCorrectionIcon(
                      penaltyQuestion: penaltySummary
                          .penalties[currentQuiz.questions[index]],
                      penaltyAnswer: currentQuiz.answers[index],
                      size: 30),
                  title: PenaltyDescription(penaltyId: index),
                  //Text(penaltySummary.penalties[index].description, maxLines: 4,),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () {
                    Get.to(
                      // TODO: Use a dedicated correction view link instead of the penalty detailed view
                      PagePenaltyDescription(index: index),
                      transition: Transition.rightToLeftWithFade,
                    );
                  },
                ),
                Divider(),
              ],
            );
          },
        )));
    //   Scaffold(
    //   appBar: AppBar(
    //     title: Text(AppLocalizations.of(context)!.quizzCorrectionListHeader),
    //   ),
    //   body: SafeArea(
    //     child: Scrollbar(
    //       child: SingleChildScrollView(
    //         scrollDirection: Axis.vertical,
    //         child: Padding(
    //           padding: EdgeInsets.all(16),
    //           child: Column(
    //             children: [
    //               // Quiz Question Title
    //               Align(
    //                 alignment: Alignment.center,
    //                 child: RichText(
    //                     text: TextSpan(
    //                   style: Theme.of(context).textTheme.headlineMedium,
    //                   children: [
    //                     TextSpan(
    //                         // text: AppLocalizations.of(context)!.quizz,
    //                         style: TextStyle(
    //                             color: Theme.of(context).colorScheme.primary)
    //                         // style: Theme.of(context).textTheme.headlineMedium,
    //                         ),
    //                   ],
    //                 )),
    //               ),
    //
    //               // The list of the questions
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
