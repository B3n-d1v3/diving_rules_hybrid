import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../l10n/diving_rules_localizations.dart';
import '../models/globals.dart';
import '../nav_penalty_list/screen_penalty_list.dart';
import 'screen_checklist.dart';
import 'screen_checklist_assistant_referee.dart';

class ScreenChecklistMenu extends StatefulWidget {
  const ScreenChecklistMenu({super.key});

  @override
  State<ScreenChecklistMenu> createState() => _ScreenChecklistMenuState();
}

class _ScreenChecklistMenuState extends State<ScreenChecklistMenu> {
  @override
  void initState() {
    // could be 'start', 'rulebook', 'penalties', 'quiz', 'checklist', 'about'
    currentPage = 'checklist';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(CupertinoIcons.flag_fill, size: 30),
              title: Text(localizations.checklistMenuReferee),
              trailing: const CupertinoListTileChevron(),
              onTap: () {
                Get.to(
                  () => const ScreenChecklist(),
                  transition: Transition.rightToLeftWithFade,
                  curve: Curves.ease,
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(CupertinoIcons.person_2_fill, size: 30),
              title: Text(localizations.checklistMenuAssistantReferee),
              trailing: const CupertinoListTileChevron(),
              onTap: () {
                Get.to(
                  () => const ScreenAssistantRefereeChecklist(),
                  transition: Transition.rightToLeftWithFade,
                  curve: Curves.ease,
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(CupertinoIcons.square_list_fill, size: 30),
              title: Text(localizations.checklistMenuJudgePenalties),
              trailing: const CupertinoListTileChevron(),
              onTap: () {
                Get.to(
                  () => const ScreenPenaltyList(),
                  transition: Transition.rightToLeftWithFade,
                  curve: Curves.ease,
                );
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
