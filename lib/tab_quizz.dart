import 'package:flutter/cupertino.dart';

class CupertinoTabQuizz extends StatefulWidget {
  const CupertinoTabQuizz({Key? key}) : super(key: key);

  @override
  _CupertinoTabQuizzState createState() =>
      _CupertinoTabQuizzState();
}

class _CupertinoTabQuizzState extends State<CupertinoTabQuizz> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Quizz'),
      ),
      child: Center(
        child: Text('Here are some questions for you...'),
      ),
    );
  }
}