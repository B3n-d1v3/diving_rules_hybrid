import 'package:diving_rules_hybrid/sub_views/diving_rules_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:provider/provider.dart';

import 'nav_about/screen_about.dart';
import 'nav_penalty_list/screen_penalty_list.dart';
import 'nav_quiz/screen_quiz.dart';
import 'nav_rulebook/screen_rulebook.dart';
// theme
import 'theme/model_theme.dart';
import 'theme/theme_selector.dart';

const int extendedNavigationRailMinScreenWidth = 600;
const int mobileUiMaxScreenWidth = 500;

class DivingRulesMainScreen extends StatefulWidget {
  @override
  State<DivingRulesMainScreen> createState() => _DivingRulesMainScreenState();
}

class _DivingRulesMainScreenState extends State<DivingRulesMainScreen> {
  var _selectedIndex = 0;

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
                ? DivingRulesLogo(
                    small: true,
                  )
                : Text(selectedItem.label),
            actions: [ThemeSelector()],
          ),
          bottomNavigationBar:
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
                          extended: MediaQuery.of(context).size.width >=
                              extendedNavigationRailMinScreenWidth,
                          destinations:
                              navigationItems.getNavigationRailDestinations(),
                          selectedIndex: _selectedIndex,
                          onDestinationSelected: (value) {
                            setState(() {
                              _selectedIndex = value;
                            });
                          },
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
          // TODO: Change the rules header to the app name while keeping the rules bottom navigation correct
          // label: AppLocalizations.of(context)!.cFBundleName,
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
