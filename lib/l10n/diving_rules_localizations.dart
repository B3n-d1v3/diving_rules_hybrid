import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'diving_rules_localizations_de.dart';
import 'diving_rules_localizations_en.dart';
import 'diving_rules_localizations_es.dart';
import 'diving_rules_localizations_fr.dart';
import 'diving_rules_localizations_it.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/diving_rules_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('es', 'MX'),
    Locale('fr'),
    Locale('it'),
  ];

  /// Localizable.strings
  ///   Diving Rules
  ///
  ///   Created by Benoit SUZANNE on 22/03/2021.
  ///
  ///
  ///  Navigation - Rules Menu Item
  ///
  /// In en, this message translates to:
  /// **'Rules'**
  String get navigationMenuRules;

  /// Navigation - Penalties Menu Item
  ///
  /// In en, this message translates to:
  /// **'Penalties'**
  String get navigationMenuPenalties;

  /// Navigation - Quizz Menu Item
  ///
  /// In en, this message translates to:
  /// **'Quiz'**
  String get navigationMenuQuizz;

  /// Navigation - Pools Menu Item
  ///
  /// In en, this message translates to:
  /// **'Pools'**
  String get navigationMenuPools;

  /// Navigation - Search Menu Item
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get navigationMenuSearch;

  /// Penalties List Page
  ///  Penalties List Page - Title
  ///
  /// In en, this message translates to:
  /// **'Penalty Cases'**
  String get penaltiesListTitle;

  /// Penalty - Ownership Section Button Judge
  ///
  /// In en, this message translates to:
  /// **'Judge'**
  String get buttonJudge;

  /// Penalty Detail Page
  ///  Penalty - Rule Title
  ///
  /// In en, this message translates to:
  /// **'Rule'**
  String get penaltyRule;

  /// Penalty - Description Section Title
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get penaltyDescription;

  /// Penalty - Penalty Section Title
  ///
  /// In en, this message translates to:
  /// **'Penalty'**
  String get penaltyPenalty;

  /// Penalty - Ownership Section Title
  ///
  /// In en, this message translates to:
  /// **'By whom'**
  String get penaltyOwnership;

  /// Penalty Detail Page Buttons
  ///  Penalty - Penalty Section Button 0 pts
  ///
  /// In en, this message translates to:
  /// **'0 pts'**
  String get button0pts;

  /// Penalty - Penalty Section Button max 2 pts
  ///
  /// In en, this message translates to:
  /// **'max 2 pts'**
  String get buttonMax2pts;

  /// Penalty - Penalty Section Button max 4 ½ pts
  ///
  /// In en, this message translates to:
  /// **'max 4 ½ pts'**
  String get buttonMax4Halfpts;

  /// Penalty - Penalty Section Button -2 pts
  ///
  /// In en, this message translates to:
  /// **'-2 pts'**
  String get buttonMinus2pts;

  /// Penalty - Penalty Section Button - ½ to 2 pts
  ///
  /// In en, this message translates to:
  /// **'- ½ to 2 pts'**
  String get buttonMinusHalfTo2pts;

  /// Penalty - Penalty Section Button judge Opinion
  ///
  /// In en, this message translates to:
  /// **'judge opinion'**
  String get buttonJudgeOpinion;

  /// Penalty - Ownership Section Button Referee
  ///
  /// In en, this message translates to:
  /// **'Referee'**
  String get buttonReferee;

  /// Quizz Selection Page
  ///  Quizz - Intro Title
  ///
  /// In en, this message translates to:
  /// **'Take A Quiz'**
  String get quizzIntroTitle;

  /// Quizz - Intro Description
  ///
  /// In en, this message translates to:
  /// **'In order to train yourself on the World Aquatics Diving Rules, with this test you will be able to review the Rule Book\'s Penalty Summary through questions on the various rules. \nThis test alone is not enough to pass the judge exam, as it is focussed on the penalty summary, but it helps learn the rules penalty assignment. \n\nSelect the number of questions you would like in your quiz (from 5 to 40).'**
  String get quizzIntroDescription;

  /// Quizz - Intro Start Button
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get quizzIntroStartButton;

  /// Quizz - Question Page Next Button
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get quizzNext;

  /// Localizable.strings
  ///   Diving Rules
  ///
  ///   Created by Benoit SUZANNE on 22/03/2021.
  ///
  ///  App Name - Full App name
  ///
  /// In en, this message translates to:
  /// **'diving rules'**
  String get cFBundleDisplayName;

  /// App Name - Short App name 16 car
  ///
  /// In en, this message translates to:
  /// **'diving rules'**
  String get cFBundleName;

  /// Quizz Selection Page
  ///  Quizz - Title
  ///
  /// In en, this message translates to:
  /// **'Quiz'**
  String get quizzTitle;

  /// Quizz - Result Title
  ///
  /// In en, this message translates to:
  /// **'Quiz Result'**
  String get quizzResultTitle;

  /// Quizz - Intro Description
  ///
  /// In en, this message translates to:
  /// **'Here is the result of your answer to this Quiz: '**
  String get quizzResultDescription;

  /// Quizz - Result Start Button
  ///
  /// In en, this message translates to:
  /// **'New Quiz'**
  String get quizzResultStartButton;

  /// Quizz - Good Sticker
  ///
  /// In en, this message translates to:
  /// **'Passed'**
  String get passed;

  /// Quizz - Good Sticker
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// Search Selection Page
  ///  Search - Title
  ///
  /// In en, this message translates to:
  /// **'Search The Rules'**
  String get searchTitle;

  /// Rule Book Selection Page
  ///  Rule Book - Title
  ///
  /// In en, this message translates to:
  /// **'Rule Book'**
  String get ruleBookTitle;

  /// Quizz - Question
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get quizzQuestion;

  /// Quizz - Result Error Review Button
  ///
  /// In en, this message translates to:
  /// **'Errors'**
  String get quizzResultReviewButton;

  /// Quizz - Result Result Review Legend - unused
  ///
  /// In en, this message translates to:
  /// **'Unused'**
  String get quizzResultLegendUnused;

  /// Quizz - Result Result Review Legend - unused
  ///
  /// In en, this message translates to:
  /// **'My answer'**
  String get quizzResultLegendUserAnswer;

  /// Quizz - Result Result Review Legend - unused
  ///
  /// In en, this message translates to:
  /// **'Good answer'**
  String get quizzResultLegendRealAnswer;

  /// Penalty Descripion List
  ///  Penalty 0 - 8.5.5 - If the Athlete fails to dive within a reasonable time frame after the Referee’s warning  (max 1 min).
  ///
  /// In en, this message translates to:
  /// **'If the Athlete fails to dive within a reasonable time frame after the Referee’s warning  (max 1 min).'**
  String get penalty0;

  /// Penalty 1 - 8.6.5.2 - 10.3.4 - If in a springboard dive, the Athlete double bounces during the approach or on the end of the springboard.
  ///
  /// In en, this message translates to:
  /// **'If in a springboard dive, the Athlete double bounces during the approach or on the end of the springboard.'**
  String get penalty1;

  /// Penalty 2 - 8.6.5.3 - 10.3.3 - If in a running dive, the Athlete’s final step or jump before a two-footed take-off is also from two feet.
  ///
  /// In en, this message translates to:
  /// **'If in a running dive, the Athlete’s the final step or jump before a two-footed take-off is also from two feet.'**
  String get penalty2;

  /// Penalty 3 - 8.6.5.4 - 10.4.4 - If the take-off from the springboard or platform is not from both feet simultaneously.
  ///
  /// In en, this message translates to:
  /// **'If the take-off from the springboard or platform is not from both feet simultaneously.'**
  String get penalty3;

  /// Penalty 4 - 8.6.5.5 - 10.6.6 - If the twist in a dive at entry is greater or less than that announced by 90 degrees or more.
  ///
  /// In en, this message translates to:
  /// **'If the twist in a dive at entry is greater or less than that announced by 90º or more.'**
  String get penalty4;

  /// Penalty 5 - 8.4.6 - 10.1.7 - 11.6.2 - If the Athlete has performed a dive of a number other than that announced.
  ///
  /// In en, this message translates to:
  /// **'If an Athlete has performed a dive of a number other than that announced.'**
  String get penalty5;

  /// Penalty 6 - 8.6.5.6 - If in a head-first entry dive, the feet enter the water before the head or hands.
  ///
  /// In en, this message translates to:
  /// **'If in a head-first entry dive, the feet enter the water before the head or hands.'**
  String get penalty6;

  /// Penalty 7 - 8.6.5.7  - If in a feet-first entry dive, the head or hands enter the water before the feet.
  ///
  /// In en, this message translates to:
  /// **'If in a feet-first entry dive, the head or hands enter the water before the feet.'**
  String get penalty7;

  /// Penalty 8 - 8.7 - If the Athlete receives assistance during the performance of a dive, after the Referee’s starting signal.
  ///
  /// In en, this message translates to:
  /// **'If an Athlete receives assistance during the performance of a dive, after the Referee’s starting signal.'**
  String get penalty8;

  /// Penalty 9 - 8.6.5.1 - When a second attempt (a re-start) is unsuccessful.
  ///
  /// In en, this message translates to:
  /// **'When a second attempt (a re-start) is unsuccessful.'**
  String get penalty9;

  /// Penalty 10 - 8.5.7 - If the Athlete refuses or fails to perform a dive.
  ///
  /// In en, this message translates to:
  /// **'If the Athlete refuses or fails to perform a dive.'**
  String get penalty10;

  /// Penalty 11 - 11.2 - In synchronised diving, if the Athlete, or both Athletes, perform a dive of a Number or Position other than that announced.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving, if the Athlete, or both Athletes, perform a dive of a Number other than that announced.'**
  String get penalty11;

  /// Penalty 12 - 11.6.3 - In synchronised diving if all execution judges for one Athlete award 0 points.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving if all execution judges for one Athlete award 0 points.'**
  String get penalty12;

  /// Penalty 13 - 11.7.5 - In synchronised diving, if all synchronisation Judges award 0 points.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving, if all synchronisation Judges award 0 points.'**
  String get penalty13;

  /// Penalty 14 - 11.2 - In synchronised diving, if an Athlete, or both Athletes, perform a dive of a Position other than that announced.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving, if an Athlete, or both Athletes, perform a dive of a Position other than that announced.'**
  String get penalty14;

  /// Penalty 15 - 11.3 - In synchronised diving, if either Athlete enters the surface of the water before the other Athlete leaves the springboard or platform.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving, if either Athlete enters the surface of the water before the other Athlete leaves the springboard or platform.'**
  String get penalty15;

  /// Penalty 16 - 11.5 - In a synchronised springboard diving, if a forward facing dive is not performed with a running approach.
  ///
  /// In en, this message translates to:
  /// **'In a synchronised springboard diving, if a forward facing dive is not performed with a running approach.'**
  String get penalty16;

  /// Penalty 17 - 8.6.1.1 - If during a running dive, the Athlete takes any step(s) during the approach and then stops.
  ///
  /// In en, this message translates to:
  /// **'If during a running dive, the Athlete takes any step(s) during the approach and then stops.'**
  String get penalty17;

  /// Penalty 18 - 8.6.1.2 - If during a standing dive, the Athlete stops the take-off movement after the legs have begun to bend or to press into the platform to initiate the take-off.
  ///
  /// In en, this message translates to:
  /// **'If during a standing dive, the Athlete stops the take-off movement after the legs have begun to bend or to press into the platform to initiate the take-off.'**
  String get penalty18;

  /// Penalty 19 - 8.6.4 - When there is a restart in a running, standing, or Armstand dive.
  ///
  /// In en, this message translates to:
  /// **'When there is a restart in a running, standing, or Armstand dive.'**
  String get penalty19;

  /// Penalty 20 - 8.6.2.1 - If during an armstand dive, the Athlete lost their balance and moved one or both hands from their original position at the front edge of the platform.
  ///
  /// In en, this message translates to:
  /// **'If during an armstand dive, the Athlete lost their balance and moved one or both hands from their original position at the front edge of the platform.'**
  String get penalty20;

  /// Penalty 21 - 8.6.2.2 - If during an armstand dive, one or both of the Athlete’s feet returned to the platform prior to the take-off.
  ///
  /// In en, this message translates to:
  /// **'If during an armstand dive, one or both of the Athlete’s feet returned to the platform prior to the take-off.'**
  String get penalty21;

  /// Penalty 22 - 8.6.2.3 - If during an armstand dive, a foot or any part of the Athlete’s body other than their hands touched the platform after the Athlete has assumed the starting position.
  ///
  /// In en, this message translates to:
  /// **'If during an armstand dive, a foot or any part of the Athlete’s body other than their hands touched the platform after the Athlete has assumed the starting position.'**
  String get penalty22;

  /// Penalty 23 - 11.4 - In synchronised diving, if there is a restart, whether required or caused by one or both Athletes.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving, if there is a restart, whether required or caused by one or both Athletes.'**
  String get penalty23;

  /// Penalty 24 - 10.1.4 - 8.4.7 - If the Athlete performs a dive in a Position other than that announced.
  ///
  /// In en, this message translates to:
  /// **'If the Athlete performs a dive in a Position other than that announced.'**
  String get penalty24;

  /// Penalty 25 - 10.5.4.2.1 - if a dive was unsafe as a result of the Athlete having touched the springboard or platform with their head during the flight.
  ///
  /// In en, this message translates to:
  /// **'if a dive was unsafe as a result of the Athlete having touched the springboard or platform with their head during the flight.'**
  String get penalty25;

  /// Penalty 26 - 10.5.4.2.1 - If a dive was considered unsafe as a result of the Athlete been unsafely close to the springboard or platform with their head during the flight.
  ///
  /// In en, this message translates to:
  /// **'If a dive was considered unsafe as a result of the Athlete been unsafely close to the springboard or platform with their head during the flight.'**
  String get penalty26;

  /// Penalty 27 - 10.5.4.2.2 - If the majority of the Judges Panel indicates that the dive was unsafe.
  ///
  /// In en, this message translates to:
  /// **'If the majority of the Judges Panel indicates that the dive was unsafe.'**
  String get penalty27;

  /// Penalty 28 - 10.5.4.1.2 - After reviewing a dive with visual technology, if the performance of the dive was unsafe.
  ///
  /// In en, this message translates to:
  /// **'After reviewing a dive with visual technology, if the performance of the dive was unsafe.'**
  String get penalty28;

  /// Penalty 29 - 8.6.7.1 - 10.6.4 - If in a feet-first entry dive, the Athlete has one or both arms held above the head.
  ///
  /// In en, this message translates to:
  /// **'If in a feet-first entry dive, the Athlete has one or both arms held above the head.'**
  String get penalty29;

  /// Penalty 30 - 8.6.7.2 - 10.6.3 - If in a head-first entry dive, the Athlete has one or both arms held below the head.
  ///
  /// In en, this message translates to:
  /// **'If in a head-first entry dive, the Athlete has one or both arms held below the head.'**
  String get penalty30;

  /// Penalty 31 - 8.6.7.3 - 10.5.5.1.3 - In a dive with a flying action, the Straight Position is not shown for at least one quarter of a somersault (90º) in dives with up to 1 somersault.
  ///
  /// In en, this message translates to:
  /// **'In a dive with a flying action, the Straight Position is not shown for at least one quarter of a somersault (90º) in dives with up to 1 somersault.'**
  String get penalty31;

  /// Penalty 32 - 8.6.7.3 - 10.5.5.1.3 - In a dive with a flying action, the Straight Position is not shown for at least one half of a somersault (180º) in dives with more than 1 somersault.
  ///
  /// In en, this message translates to:
  /// **'In a dive with a flying action, the Straight Position is not shown for at least one half of a somersault (180º) in dives with more than 1 somersault.'**
  String get penalty32;

  /// Penalty 33 - 10.1.6 - If a dive is not performed in a Position as described.
  ///
  /// In en, this message translates to:
  /// **'If a dive is not performed in a Position as described in the rules.'**
  String get penalty33;

  /// Penalty 34 - 10.2.2 - If the starting position is not body straight, head erect and facing forward, arms straight (along the body, perpendicular to the body or overhead).
  ///
  /// In en, this message translates to:
  /// **'If the starting position is not body straight, head erect and facing forward, arms straight along the body, or perpendicular to the body or overhead.'**
  String get penalty34;

  /// Penalty 35 - 10.2.3.3 - If in the starting position for a standing dive, the Athlete’s feet leave the springboard or platform before the take-off.
  ///
  /// In en, this message translates to:
  /// **'If in the starting position for a standing dive, the Athlete’s feet leave the springboard or platform before the take-off.'**
  String get penalty35;

  /// Penalty 36 - 10.2.5.2 - If in the starting position for an Armstand dive, the Athlete is unable to hold a stationary and steady balance in the straight vertical Armstand Position.
  ///
  /// In en, this message translates to:
  /// **'If in the starting position for an Armstand dive, the Athlete is unable to hold a stationary and steady balance in the straight vertical Armstand Position.'**
  String get penalty36;

  /// Penalty 37 - 10.2.5.2 - If during an Armstand dive, the hands lose contact with the platform during the takeoff.
  ///
  /// In en, this message translates to:
  /// **'If during an Armstand dive, the hands lose contact with the platform during the takeoff.'**
  String get penalty37;

  /// Penalty 38 - 10.3.2 - If during the approach, the run is not smooth, aesthetically pleasing and in a forward direction.
  ///
  /// In en, this message translates to:
  /// **'If during the approach, the run is not smooth, aesthetically pleasing and in a forward direction.'**
  String get penalty38;

  /// Penalty 39 - 10.4.6 - If in running and standing dives, the take-off is not balanced or high.
  ///
  /// In en, this message translates to:
  /// **'If in running and standing dives, the take-off is not balanced or high.'**
  String get penalty39;

  /// Penalty 40 - 10.4.7 - If in a twisting dive, the twist has clearly begun on the springboard or platform.
  ///
  /// In en, this message translates to:
  /// **'If in a twisting dive, the twist has clearly begun on the springboard or platform.'**
  String get penalty40;

  /// Penalty 41 - 10.5.5.1.1 - 10.1.6 - If the Straight position is not body straight, not bent either at the knees or hips, feet kept together and toes pointed, or aesthetically pleasing.
  ///
  /// In en, this message translates to:
  /// **'If the Straight position is not body straight, not bent either at the knees or hips, feet kept together and toes pointed, or aesthetically pleasing.'**
  String get penalty41;

  /// Penalty 42 - 10.5.5.2.2 - 10.1.6 - If the Pike position is not body bent at the hips, legs must straight at the knees, feet together and toes pointed, or aesthetically pleasing.
  ///
  /// In en, this message translates to:
  /// **'If the Pike position is not body bent at the hips, legs must straight at the knees, feet together and toes pointed, or aesthetically pleasing.'**
  String get penalty42;

  /// Penalty 43 - 10.5.5.2.3 - If in a Pike dive with a twist, the Pike position is not clearly shown.
  ///
  /// In en, this message translates to:
  /// **'If in a Pike dive with a twist, the Pike position is not clearly shown.'**
  String get penalty43;

  /// Penalty 44 - 10.5.5.3.2 - 10.1.6 - If the Tuck Position is not body compact, bent at the knees and hips with knees and feet close together within the bodyline of the shoulders, hands on the lower legs and the toes pointed, or aesthetically pleasing.
  ///
  /// In en, this message translates to:
  /// **'If the Tuck Position is not body compact, bent at the knees and hips with knees and feet close together within the bodyline of the shoulders, hands on the lower legs and the toes pointed, or aesthetically pleasing.'**
  String get penalty44;

  /// Penalty 45 - 10.5.5.3.3 - If in a Tuck dive with twist, the Tuck Position is not clearly shown.
  ///
  /// In en, this message translates to:
  /// **'If in a Tuck dive with twist, the Tuck Position is not clearly shown.'**
  String get penalty45;

  /// Penalty 46 - 10.5.5.4 - 10.1.6 - If the Free position is not using one of the optional position between Straight, Pike, or Tuck and with legs together, and toes pointed.
  ///
  /// In en, this message translates to:
  /// **'If the Free position is not using one of the optional position between Straight, Pike, or Tuck and with legs together, and toes pointed.'**
  String get penalty46;

  /// Penalty 47 - 10.6.5 - If in a head-first entry dive, the arms are not in the correct position, even if they are held beyond the head.
  ///
  /// In en, this message translates to:
  /// **'If in a head-first entry dive, the arms are not in the correct position, even if they are held beyond the head.'**
  String get penalty47;

  /// Penalty 48 - 10.6.5 - If in a feet-first entry dive, the arms are not in the correct position, even if they are held below the head.
  ///
  /// In en, this message translates to:
  /// **'If in a feet-first entry dive, the arms are not in the correct position, even if they are held below the head.'**
  String get penalty48;

  /// Penalty 49 - 11.7.3 - In synchronised diving if similarity of the starting position, approach, take-off and height is not shown.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving if similarity of the starting position, approach, take-off and height is not shown.'**
  String get penalty49;

  /// Penalty 50 - 11.7.3 - In synchronised diving if coordinated timing of the movement during the flight is not shown.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving if coordinated timing of the movement during the flight is not shown.'**
  String get penalty50;

  /// Penalty 51 - 11.7.3 - In synchronised diving if similarity of the vertical angles of the entries is not shown.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving if similarity of the vertical angles of the entries is not shown.'**
  String get penalty51;

  /// Penalty 52 - 11.7.3 - In synchronised diving if comparative distance from the springboard or platform of the entry is not shown.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving if comparative distance, of the entry, from the springboard or platform is not shown.'**
  String get penalty52;

  /// Penalty 53 - 11.7.3 - In synchronised diving if coordinated timing of the entries is not shown.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving if coordinated timing of the entries is not shown.'**
  String get penalty53;

  /// Penalty 54 - 10.1.5 - If a dive is performed partially in a Position other than that announced.
  ///
  /// In en, this message translates to:
  /// **'If a dive is performed partially in a Position other than that announced.'**
  String get penalty54;

  /// Penalty 55 - 10.5.2 - If during the flight of a dive, the Athlete does not maintain a straight line of flight.
  ///
  /// In en, this message translates to:
  /// **'If during the flight of a dive, the Athlete does not maintain a straight line of flight.'**
  String get penalty55;

  /// Penalty 56 - 10.5.3 - If during the flight of a dive, an Athlete touches the end of the springboard or platform with their feet or hands.
  ///
  /// In en, this message translates to:
  /// **'If during the flight of a dive, an Athlete touches the end of the springboard or platform with their feet or hands.'**
  String get penalty56;

  /// Penalty 57 - 10.6.2 - If the entry is short, at an angle less than vertical.
  ///
  /// In en, this message translates to:
  /// **'If the entry is short, at an angle less than vertical.'**
  String get penalty57;

  /// Penalty 58 - 10.6.2 - If the entry is long, at an angle exceeding vertical.
  ///
  /// In en, this message translates to:
  /// **'If the entry is long, at an angle exceeding vertical.'**
  String get penalty58;

  /// Penalty 59 - 10.6.2 - If at entry the body is twisted.
  ///
  /// In en, this message translates to:
  /// **'If at entry the body is twisted.'**
  String get penalty59;

  /// Penalty 60 - 10.6.2 - If at entry the body is not straight.
  ///
  /// In en, this message translates to:
  /// **'If at entry the body is not straight.'**
  String get penalty60;

  /// Penalty 61 - 10.6.2 - If at entry the feet are not together, toes not pointed.
  ///
  /// In en, this message translates to:
  /// **'If at entry the feet are not together, toes not pointed.'**
  String get penalty61;

  /// Penalty 62 - 10.6.2 - If at entry the water’s surface is significantly disturbed.
  ///
  /// In en, this message translates to:
  /// **'If at entry the water’s surface is significantly disturbed.'**
  String get penalty62;

  /// Quizz - Intro Question Number
  ///
  /// In en, this message translates to:
  /// **'Number of Questions: '**
  String get quizzIntroQuestionNumber;

  /// About Selection Page
  ///  About - Title
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutTitle;

  /// About - Version
  ///
  /// In en, this message translates to:
  /// **'Version: '**
  String get aboutVersion;

  /// About - Description
  ///
  /// In en, this message translates to:
  /// **'This application was created to allow users to learn and train on the diving rules from the World Aquatics diving rules. This application is not a World Aquatics official application, but uses the World Aquatics official rules or it’s official translations as a work tool.\n\n With this App you can:\n✔︎ Read through the rules.\n✔︎ Learn the penalty summary.\n✔︎ Train with a quiz on the penalties.'**
  String get aboutDescription;

  /// No description provided for @aboutFeedbackLink.
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get aboutFeedbackLink;

  /// About - Rules Local
  ///
  /// In en, this message translates to:
  /// **'Current Rulebook: World Aquatics - 18 fev 2026'**
  String get aboutRulesLocal;

  /// About - Rules Reference
  ///
  /// In en, this message translates to:
  /// **'Rules for the app: World Aquatics - 18 feb 2026'**
  String get aboutRulesReference;

  /// About - License
  ///
  /// In en, this message translates to:
  /// **'The original version was created in 2021 by Benoît SUZANNE under the GPL 3.0 open source licence. This license is the GNU General Public License is a free copyleft license.'**
  String get aboutLicense;

  /// About - Thanks
  ///
  /// In en, this message translates to:
  /// **'Special thanks to :\n• Daniel AZORIN for his support in the finalization of the app\n• Piero ITALIANI for the help in the Italian translation.\n• Macarena SALGADO PATON and Daniel AZORIN for the Spanish translation\n• Thomas HAUSOTTER for the German translation'**
  String get aboutThanks;

  /// About - Help
  ///
  /// In en, this message translates to:
  /// **'Do not hesitate to contact us:\n- If you are willing to help for new translation updates\n- For any question, feedback and new features ideas'**
  String get aboutHelp;

  /// About - Description Title
  ///
  /// In en, this message translates to:
  /// **'About this App'**
  String get aboutDescriptionTitle;

  /// About - World Aquatics Diving Link
  ///
  /// In en, this message translates to:
  /// **'WA Diving'**
  String get aboutWADivingLink;

  /// About - World Aquatics Rules Link
  ///
  /// In en, this message translates to:
  /// **'Latest Rules'**
  String get aboutWARulesLink;

  /// About - License Title
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get aboutLicenseTitle;

  /// About - Help Title
  ///
  /// In en, this message translates to:
  /// **'Thanks'**
  String get aboutThanksTitle;

  /// No description provided for @aboutFeedbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Tell me more'**
  String get aboutFeedbackTitle;

  /// About - Share Title
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get aboutShareTitle;

  /// About - Share
  ///
  /// In en, this message translates to:
  /// **'Share this App'**
  String get aboutShare;

  /// Quiz Question Page /  Quiz - Questions - Top App Bar title
  ///
  /// In en, this message translates to:
  /// **'Questions'**
  String get quizzQuestionHeader;

  /// Quiz Result Page /  Quiz - Result - Top App Bar title
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get quizzResultHeader;

  /// Quiz Correction List Page /  Quiz - Question List for correction - Top App Bar title
  ///
  /// In en, this message translates to:
  /// **'Corrections'**
  String get quizzCorrectionListHeader;

  /// Quiz Correction Detail Page /  Quiz - Question Detailed correction - Top App Bar title
  ///
  /// In en, this message translates to:
  /// **'Correction'**
  String get quizzCorrectionDetailHeader;

  /// Quiz - Question - warning snackbar message
  ///
  /// In en, this message translates to:
  /// **'Select Penalty and by whom before going to next question.'**
  String get quizzQuestionWarningNext;

  /// Rulebook - The copy button when a user selects text in the rulebook pdf view.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get rulebookCopy;

  /// Rulebook - The bookmark button.
  ///
  /// In en, this message translates to:
  /// **'Bookmarks'**
  String get rulebookBookmarks;

  /// Rulebook - Search - Search button.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get rulebookSearch;

  /// Rulebook - Search - message when no result has been found.
  ///
  /// In en, this message translates to:
  /// **'No result found'**
  String get rulebookSearchNoResult;

  /// Rulebook - Search - Hit text in the input field.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get rulebookSearchHintText;

  /// Rulebook - Search - previous button tooltip text description.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get rulebookSearchPrevious;

  /// Rulebook - Search - previous button tooltip text description.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get rulebookSearchNext;

  /// Rulebook - Search - previous button tooltip text description.
  ///
  /// In en, this message translates to:
  /// **'Cancel Search'**
  String get rulebookSearchCancel;

  /// Top header bar language selection icon tooltip.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageSelection;

  /// Tooltip wording in the penalty detail for button to switch penalty from list.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// Tooltip wording in the penalty detail for button to switch penalty from list.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Pools tab - AppBar button tooltip to geo-locate the user on the map.
  ///
  /// In en, this message translates to:
  /// **'Locate me'**
  String get poolsLocateMeTooltip;

  /// Pools tab - AppBar button tooltip to open the pool submission form.
  ///
  /// In en, this message translates to:
  /// **'Add new pool'**
  String get poolsAddPoolTooltip;

  /// Pools tab - snackbar shown when the user denies the locate-me location permission request.
  ///
  /// In en, this message translates to:
  /// **'Location permission was denied. Enable it in your device settings to locate yourself on the map.'**
  String get poolsLocationDenied;

  /// Pools tab - banner shown when the map falls back to cached or bundled data instead of a live fetch.
  ///
  /// In en, this message translates to:
  /// **'Showing saved pool data - couldn\'t reach the latest version.'**
  String get poolsOfflineBanner;

  /// Pools tab - button in a pool's detail bottom sheet to open directions in Maps.
  ///
  /// In en, this message translates to:
  /// **'Get directions'**
  String get poolsGetDirections;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en', 'es', 'fr', 'it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'es':
      {
        switch (locale.countryCode) {
          case 'MX':
            return AppLocalizationsEsMx();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
