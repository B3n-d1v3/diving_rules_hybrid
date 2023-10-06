import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:get/get.dart';

// import '../theme/model_theme.dart';
import '../models/globals.dart';
// import 'package:get/get.dart';

class ActionSearch extends StatefulWidget {
  const ActionSearch({super.key});

  @override
  State<ActionSearch> createState() => _ActionSearchState();
}

class _ActionSearchState extends State<ActionSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 32,
        child: IconButton(
          icon: Icon(CupertinoIcons.search),
          onPressed: () {
            setState(() {
              //
              // search = !search;
              search = true;
              // _showScrollHead = false;
              // _showToolbar = true;
              // _ensureHistoryEntry();
              // TODO CURRENT Test if the rulebook page is already open and not refresh the page
              // if (Get.currentRoute.toString() != '/') {
              //   // when the page is NOT the home
              //   debugPrint(
              //       '>>>>> action_search > Not in the home page (Get.currentRoute.toString()= ${Get.currentRoute.toString()})');
              Get.offAllNamed(
                // '/',
                '/rulebook',
                // arguments: {'currentPage': ''},
              );
              // } else {
              //   // TODO CURRENT Tests always end up here???? TO Check Why???
              //   // when the page is the home
              //   debugPrint(
              //       '>>>>> action_search > Within the home page (Get.currentRoute.toString()= ${Get.currentRoute.toString()})');
              // };
            });
          },
          tooltip: AppLocalizations.of(context)!.rulebookSearchCancel,
          //    ), // Semantics
        ));
  }
}
