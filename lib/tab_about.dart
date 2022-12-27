import 'package:flutter/cupertino.dart';

class CupertinoTabAbout extends StatefulWidget {
  const CupertinoTabAbout({Key? key}) : super(key: key);

  @override
  _CupertinoTabAboutState createState() =>
      _CupertinoTabAboutState();
}

class _CupertinoTabAboutState extends State<CupertinoTabAbout> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('About the app'),
      ),
      child: Center(
        child: Text('Version of the App. Rules Reference and all'),
      ),
    );
  }
}
