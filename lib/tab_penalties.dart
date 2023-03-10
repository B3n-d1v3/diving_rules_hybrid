import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:diving_rules_hybrid/provider/dark_theme_provider.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';

class CupertinoTabPenalties extends StatefulWidget {
  const CupertinoTabPenalties({Key? key}) : super(key: key);

  @override
  _CupertinoTabPenaltiesState createState() => _CupertinoTabPenaltiesState();
}

class _CupertinoTabPenaltiesState extends State<CupertinoTabPenalties> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context)!.penaltiesListTitle),

        // Header trailing functions: Light/Dark switch + Language Selection
        trailing: CupertinoButton(
          onPressed: () {
            setState(() {
              themeState.darkTheme = !themeState.darkTheme;
              // themeModeSwitch = !themeModeSwitch;
            });
          },
          padding: EdgeInsets.zero,
          child: Icon(themeState.darkTheme
              ? CupertinoIcons.moon_stars_fill
              : CupertinoIcons.brightness_solid),
        ),
      ),
      // child: Center(
      //   child: Text('List of penalties'),
      // debugPrint("Test text printed in the console");
      child: SafeArea(child: PenaltyListView()),
      //),
    );
  }
}

// icon correspondance mapping
// Map<String, IconData> iconsMap = {
//   'nosign': CupertinoIcons.nosign,
//   'lessthan_circle_fill': CupertinoIcons.lessthan_circle_fill,
//   'lessthan_circle': CupertinoIcons.lessthan_circle,
//   'gobackward_minus': CupertinoIcons.gobackward_minus,
//   'arrow_left_right_circle': CupertinoIcons.arrow_left_right_circle,
//   'plusminus_circle': CupertinoIcons.plusminus_circle,
//   'person_fill': CupertinoIcons.person_fill,
//   'group_solid': CupertinoIcons.group_solid,
//   'chevron_right_circle_fill':CupertinoIcons.chevron_right_circle_fill,
// };


// TODO: Externalize the data model and finalize the corresponding structure
// class Rule {
//   final String ruleId;
// }

class Penalty {
  final String icon;
  final String description;
  // final string rules; // to be updated to a table of rule
  // final Int sanctionValue;
  // final Bool referee;
  // final Bool judge;

  Penalty ({
    required this.icon,
    required this.description});

  @override
  String toString(){
    return "$description (rule: xxx)";
  }
}

// TODO: Load this from the json file
List<Penalty> penalties = [
  Penalty(
      icon: 'nosign',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam accumsan sem a ante finibus malesuada. Proin pulvinar leo volutpat, tincidunt enim dignissim, suscipit arcu. Donec finibus dolor fringilla purus aliquet, pulvinar convallis lacus consectetur. '),
    Penalty(
      icon: 'lessthan_circle_fill',
      description: 'Sed quis felis et nisi tempus sodales vel ac sem.'),
    Penalty(
      icon: 'lessthan_circle',
      description: 'Donec dignissim est vel rhoncus blandit. Aliquam erat volutpat. Mauris pretium eget diam sit amet posuere. Mauris eleifend tempus metus non laoreet.'),
    Penalty(
      icon: 'gobackward_minus',
      description: 'Nam neque orci, tincidunt eu purus vel, egestas porttitor lectus.'),
    Penalty(
      icon: 'arrow_left_right_circle',
      description: 'Sed semper vehicula nibh vulputate pretium. Etiam vitae sagittis eros. Vivamus purus arcu, vulputate vel consectetur in, convallis eget odio.'),
    Penalty(
      icon: 'plusminus_circle',
      description: 'Duis vel tortor molestie mi fermentum sagittis a a eros. Sed vestibulum ac diam id elementum. Proin est est, elementum a neque sed, lobortis laoreet augue.'),
    Penalty(
      icon: 'person_fill',
      description: 'Proin at maximus tortor. In rhoncus bibendum elementum. Nulla rutrum eros quis magna aliquam pellentesque. '),
    Penalty(
      icon: 'group_solid',
      description: 'In eget iaculis arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse ullamcorper eros erat, eget convallis nunc laoreet vitae.'),
    Penalty(
      icon: 'chevron_right_circle_fill',
      description: 'Sed sed turpis eu ligula ornare pharetra sit amet a odio. Aliquam erat volutpat.'),
];

class PenaltyListView extends StatelessWidget {
  // const PenaltyListView({Key? key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: penalties.length,
      itemBuilder: (context, index){
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          // TODO: Change from ListTile to custom view to see full penalty description in each items
          child: CupertinoListTile(
            //leading:  Icon(iconsMap[penalties[index].icon]),
            leading: Icon(CupertinoIcons.lessthan_circle_fill),
            // TODO: Get the icon from the penalty type
            title: Text(penalties[index].description),
            trailing: const CupertinoListTileChevron(),
            // TODO: Add action to open penalty description page
          ),
        );
      },
    );
  }
}
