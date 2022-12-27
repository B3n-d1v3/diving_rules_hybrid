import 'package:flutter/cupertino.dart';

class CupertinoTabPenalties extends StatefulWidget {
  const CupertinoTabPenalties({Key? key}) : super(key: key);

  @override
  _CupertinoTabPenaltiesState createState() =>
      _CupertinoTabPenaltiesState();
}

class _CupertinoTabPenaltiesState extends State<CupertinoTabPenalties> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Penalty Cases'),
      ),
      child: Center(
        child: Text('page 2'),
      ),
    );
  }
}