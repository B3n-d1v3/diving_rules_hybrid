//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';

//import '../models/globals.dart';

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
        title: Text(AppLocalizations.of(context)!.quizz),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
