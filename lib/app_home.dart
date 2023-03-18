import 'package:flutter/cupertino.dart';
// import 'tokens/colors.dart';
import 'tab_about/tab_about.dart';
import 'tab_penalty_list/tab_penalties.dart';
import 'tab_quizz/tab_quizz.dart';
import 'tab_rulebook/tab_rules.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
// TODO: Make it look like iOS’ and Android’s native bottom navigation components.
// look @ https://edsonbueno.com/2020/01/23/bottom-navigation-in-flutter-mastery-guide/

// TODO: Allow the user to create an hot language switch
// look at this: https://www.youtube.com/watch?v=L99kqPA1CBU

class CupertinoDivingRulesApp extends StatelessWidget {
  const CupertinoDivingRulesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      // tODO: Take out the beta band with debugShowCheckedModeBanner: False,
      tabBar: CupertinoTabBar(
        currentIndex: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            // Rules
            icon: Icon(CupertinoIcons.book_fill),
            label: AppLocalizations.of(context)!.navigationMenuRules,
          ),
          BottomNavigationBarItem(
            // Penalties
            icon: Icon(CupertinoIcons.list_bullet),
            label: AppLocalizations.of(context)!.navigationMenuPenalties,
          ),
          BottomNavigationBarItem(
            // Quizz
            icon: Icon(CupertinoIcons.check_mark),
            label: AppLocalizations.of(context)!.navigationMenuQuizz,
          ),
          BottomNavigationBarItem(
            // About
            icon: Icon(CupertinoIcons.info_circle_fill),
            label: AppLocalizations.of(context)!.aboutTitle,
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