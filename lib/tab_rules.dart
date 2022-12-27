import 'package:flutter/cupertino.dart';

class CupertinoTabRules extends StatefulWidget {
  const CupertinoTabRules({Key? key}) : super(key: key);

  @override
  _CupertinoTabRulesState createState() =>
      _CupertinoTabRulesState();
}

class _CupertinoTabRulesState extends State<CupertinoTabRules> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Diving Rules'),
      ),
      child: Center(
        child: Text('Page 1'),
      ),
    );
  }
}