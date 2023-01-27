import 'package:flutter/cupertino.dart';
// import 'tokens/colors.dart';
import 'tab_about.dart';
import 'tab_penalties.dart';
import 'tab_quizz.dart';
import 'tab_rules.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';

class CupertinoDivingRulesApp extends StatelessWidget {
  const CupertinoDivingRulesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_fill),
            label: 'Rules',
            // label: Text(AppLocalizations.of(context)!.navigationMenuRules),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.list_bullet),
            label: 'Penalties',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.check_mark),
            label: 'Quizz',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.info_circle_fill),
            label: 'About',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        late final CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoTabRules();
              },
            );
            break;
          case 1:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoTabPenalties();
              },
            );
            break;
          case 2:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoTabQuizz();
              },
            );
            break;
          case 3:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoTabAbout();
              },
            );
            break;
        }
        return returnValue;
      },
    );
  }
}