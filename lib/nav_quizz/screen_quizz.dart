import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';

class ScreenQuizz extends StatefulWidget {
  const ScreenQuizz({Key? key}) : super(key: key);

  @override
  State<ScreenQuizz> createState() => _ScreenQuizzState();
}

class _ScreenQuizzState extends State<ScreenQuizz> {
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
            Text(AppLocalizations.of(context)!.quizzIntroDescription),
          ],
        ),
      ),
    ))));
  }
}
