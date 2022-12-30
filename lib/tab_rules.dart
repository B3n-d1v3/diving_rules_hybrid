import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CupertinoTabRules extends StatefulWidget {
  const CupertinoTabRules({Key? key}) : super(key: key);

  @override
  _CupertinoTabRulesState createState() =>
      _CupertinoTabRulesState();
}

class _CupertinoTabRulesState extends State<CupertinoTabRules> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Diving Rules 2022-2025'),
      ),
      child: Center(
        child: SfPdfViewer.asset('assets/rulebooks/2022-2025_FINA_EN_Diving-Technical-Rules.pdf')
        )
      );
  }
}