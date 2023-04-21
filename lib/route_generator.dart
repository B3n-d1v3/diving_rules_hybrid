import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'app_home.dart';
import 'tab_about/tab_about.dart';
import 'tab_penalty_list/tab_penalties.dart';
import 'tab_penalty_list/page_penalty_details.dart';
import 'tab_quizz/tab_quizz.dart';
import 'tab_rulebook/tab_rules.dart';
import '/tokens/colors.dart';

// ---- is Not used yet ----
// This was added in to test the Route generator page navigation
// It is linked to an addition in the main app:
// onGenerateRoute: RouteGenerator.generateRoute,

//  on the pages the jump is performed with:
//

// Does this work with the bottom menu navigation mechanism?
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
      case '/home':
        return CupertinoPageRoute(builder: (_) => const CupertinoDivingRulesApp());
      // TODO: Add the other pages
     // case '/quizz':
     //   return CupertinoPageRoute(builder: (_) => const CupertinoDivingRulesApp(args: args));


      default:
        return _errorRoute();
    }
  }
  
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.myErrorColorLight,
              title: const Text('Error!'),
            ),
            body: const Center(
              child: Text('Oops! There\'s a bug  🐞... \n Sorry about this, but there was an error and the page you are trying to access does not exist.'),
            ),
          );
        }
    );
  }
  
}
