// for json
import 'dart:convert';

import 'package:diving_rules_hybrid/models/globals.dart';
// the sanction data model and json deserialization
import 'package:diving_rules_hybrid/models/penalty_model.dart';
import 'package:diving_rules_hybrid/models/sanction_model.dart';
import 'package:diving_rules_hybrid/sub_views/diving_rules_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:provider/provider.dart';

import 'l10n/language_selector.dart';
import 'nav_about/screen_about.dart';
import 'nav_penalty_list/screen_penalty_list.dart';
import 'nav_quiz/screen_quiz.dart';
import 'nav_rulebook/screen_rulebook.dart';
// theme
import 'theme/model_theme.dart';
import 'theme/theme_selector.dart';

const int extendedNavigationRailMinScreenWidth = 600;
const int mobileUiMaxScreenWidth = 640;
const int mobileHeaderMaxScreenWidth = 330;

class DivingRulesMainScreen extends StatefulWidget {
  @override
  State<DivingRulesMainScreen> createState() => _DivingRulesMainScreenState();
}

class _DivingRulesMainScreenState extends State<DivingRulesMainScreen> {
  // index of the navigation choice from the user
  var _selectedIndex = 0;

  // Method to fetch content from the json file
  Future<void> getSanctions(BuildContext context) async {
    final sanctionsFile = await rootBundle
        .loadString('assets/data/divingPenaltiesSanctions.json');
    // final sanctionItems = sanctionItemsFromJson(sanctionsFile);
    setState(() {
      sanctionItems = SanctionItems.fromJson(json.decode(sanctionsFile));
      // Debug checks
      // debugPrint(">>> getPenalties > json file in string sanctionsFile:");
      // debugPrint(sanctionsFile);
      // debugPrint(">>> getPenalties > sanctionItems Object:");
      // debugPrint(
      //     "sanctionItems.sanctions.length: ${sanctionItems.sanctions.length}");
      // debugPrint(
      //     "sanctionItems.sanctions[0].description: ${sanctionItems.sanctions[3].description}");
    });
  }

  Future<void> getPenalties(BuildContext context) async {
    final summaryFile =
        await rootBundle.loadString('assets/data/divingPenaltiesSummary.json');
    // final sanctionItems = sanctionItemsFromJson(sanctionsFile);
    setState(() {
      penaltySummary = PenaltySummary.fromJson(json.decode(summaryFile));
      // Debug checks
      // debugPrint(">>> getPenalties > json file in string sanctionsFile:");
      // debugPrint(summaryFile);
      // debugPrint(">>> getPenalties > sanctionItems Object:");
      // debugPrint(
      //     "sanctionItems.sanctions.length: ${penaltySummary.penalties.length}");
      // debugPrint(
      //     "sanctionItems.sanctions[3].description: ${penaltySummary.penalties[3].description}");
    });
  }

  @override
  void initState() {
    super.initState();
    // Load the sanctions list json
    getSanctions(context);
    getPenalties(context);
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var navigationItems = _NavigationItems(context);
    var selectedItem = navigationItems.getSelectedMenuItem(_selectedIndex);

    // The container for the current page, with its background color
    // and subtle switching animation.
    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: selectedItem.screen,
      ),
    );

    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return Scaffold(
          appBar: AppBar(
            title: (_selectedIndex == 0)
                ? MediaQuery.of(context).size.width <
                        mobileHeaderMaxScreenWidth // if size too small
                    // header will position the logo to the left
                    ? DivingRulesLogo(
                        small: true,
                        leftAligned: true,
                      )
                    // otherwise logo will be centered
                    : DivingRulesLogo(
                        small: true,
                      )
                : Text(
                    selectedItem.label,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
            centerTitle: true,
            actions: [LanguageSelector(), ThemeSelector()],
            scrolledUnderElevation: 0,
          ),
          bottomNavigationBar:
              // Todo: add if the viewport is landscape or portrait to keep bottom nav on portrait
              MediaQuery.of(context).size.width < mobileUiMaxScreenWidth
                  ? BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      selectedFontSize: 15,
                      selectedItemColor: colorScheme.primary,
                      // unselectedItemColor: colorScheme.secondary,
                      unselectedItemColor: colorScheme.tertiary,
                      items: navigationItems.getBottomNavigationBarItems(),
                      elevation: 0,
                      mouseCursor: SystemMouseCursors.grab,
                      currentIndex: _selectedIndex,
                      onTap: (value) {
                        setState(() {
                          _selectedIndex = value;
                        });
                      },
                    )
                  : null,
          body: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (MediaQuery.of(context).size.width >= mobileUiMaxScreenWidth)
                LayoutBuilder(builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: NavigationRail(
                          destinations:
                              navigationItems.getNavigationRailDestinations(),
                          selectedIndex: _selectedIndex,
                          onDestinationSelected: (value) {
                            setState(() {
                              _selectedIndex = value;
                            });
                          },
                          labelType: NavigationRailLabelType.all,
                          selectedIconTheme: IconThemeData(
                            color: colorScheme.primary,
                          ),
                          unselectedIconTheme:
                              IconThemeData(color: colorScheme.tertiary),
                          selectedLabelTextStyle: TextStyle(
                            color: colorScheme.primary,
                          ),
                          unselectedLabelTextStyle: TextStyle(
                            color: colorScheme.tertiary,
                          ),
                          useIndicator: false,
                        ),
                      ),
                    ),
                  );
                }),
              Expanded(child: mainArea),
            ],
          ));
    });
  }
}

class _NavigationItems {
  late BuildContext context;
  late List<_MainMenuItem> _mainMenuItems;

  _NavigationItems(this.context) {
    var colorScheme = Theme.of(context).colorScheme;

    var activeColorFilter =
        ColorFilter.mode(colorScheme.primary, BlendMode.srcIn);
    var colorFilter = ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn);
    _mainMenuItems = [
      _MainMenuItem(
          activeIcon: Icon(CupertinoIcons.book_fill),
          icon: Icon(CupertinoIcons.book),
          label: AppLocalizations.of(context)!.navigationMenuRules,
          // TODO - Later: Change the rules header to use the diving rules correct font
          screen: ScreenRulebook()),
      _MainMenuItem(
          activeIcon: Icon(CupertinoIcons.square_list_fill),
          icon: Icon(CupertinoIcons.square_list),
          label: AppLocalizations.of(context)!.navigationMenuPenalties,
          screen: ScreenPenaltyList()),
      _MainMenuItem(
          activeIcon: Icon(CupertinoIcons.checkmark_square_fill),
          icon: Icon(CupertinoIcons.checkmark_square),
          label: AppLocalizations.of(context)!.navigationMenuQuizz,
          screen: ScreenQuiz()),
      _MainMenuItem(
          activeIcon: Icon(CupertinoIcons.info_circle_fill),
          icon: Icon(CupertinoIcons.info_circle),
          label: AppLocalizations.of(context)!.aboutTitle,
          screen: ScreenAbout()),
    ];
  }

  getSelectedMenuItem(int index) {
    return _mainMenuItems[index];
  }

  getBottomNavigationBarItems() {
    return _mainMenuItems
        .map((e) => BottomNavigationBarItem(
            icon: e.icon, activeIcon: e.activeIcon, label: e.label))
        .toList();
  }

  getNavigationRailDestinations() {
    return _mainMenuItems
        .map((e) => NavigationRailDestination(
            icon: e.icon, selectedIcon: e.activeIcon, label: Text(e.label)))
        .toList();
  }
}

class _MainMenuItem {
  const _MainMenuItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.screen,
  });

  /// The icon of the menu item.
  final Widget icon;

  /// The icon of the menu item when not selected.
  final Widget activeIcon;

  /// The text label for this menu item.
  final String label;

  /// The screen launched on menu item tap.
  final Widget screen;
}
