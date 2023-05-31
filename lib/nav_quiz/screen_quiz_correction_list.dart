import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';

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
                            // text: AppLocalizations.of(context)!.quizz,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary)
                            // style: Theme.of(context).textTheme.headlineMedium,
                            ),
                      ],
                    )),
                  ),

                  // The list of the questions
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
