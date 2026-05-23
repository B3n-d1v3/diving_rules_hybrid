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
    Locale('it')
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
  ///  Penalty 0 - D6.12 - If the diver takes more than one minute, after a warning.
  ///
  /// In en, this message translates to:
  /// **'If the diver takes more than one minute, after a warning.'**
  String get penalty0;

  /// Penalty 1 - D6.16 & D8.3.4 - If a diver double bounces on the end of the springboard or double jump on the end of the platform before take-off.
  ///
  /// In en, this message translates to:
  /// **'If a diver double bounces on the end of the springboard or double jump on the end of the platform before take-off.'**
  String get penalty1;

  /// Penalty 2 - D6.17 & D8.3.3 - If the final step is not from one foot.
  ///
  /// In en, this message translates to:
  /// **'If the final step is not from one foot.'**
  String get penalty2;

  /// Penalty 3 - D6.18 & D8.4.3 - If the take-off on the springboard is not from both feet simultaneously.
  ///
  /// In en, this message translates to:
  /// **'If the take-off on the springboard is not from both feet simultaneously.'**
  String get penalty3;

  /// Penalty 4 - D6.20 & D8.6.6- If a twist is greater or less than that announced by 90 degrees or more.
  ///
  /// In en, this message translates to:
  /// **'If a twist is greater or less than that announced by 90 degrees or more.'**
  String get penalty4;

  /// Penalty 5 - D6.21 & D8.1.7 - If a diver has performed a dive of a number other than that announced.
  ///
  /// In en, this message translates to:
  /// **'If a diver has performed a dive of a number other than that announced.'**
  String get penalty5;

  /// Penalty 6 - D6.22.1 - If the feet enter the water before the head or hands in a head first dive.
  ///
  /// In en, this message translates to:
  /// **'If the feet enter the water before the head or hands in a head first dive.'**
  String get penalty6;

  /// Penalty 7 - D6.22.2 - If the head or hands enter the water before the feet in a feet first dive.
  ///
  /// In en, this message translates to:
  /// **'If the head or hands enter the water before the feet in a feet first dive.'**
  String get penalty7;

  /// Penalty 8 - D6.24 - If assistance has been given to the diver after the starting signal.
  ///
  /// In en, this message translates to:
  /// **'If assistance has been given to the diver after the starting signal.'**
  String get penalty8;

  /// Penalty 9 - D6.27 - When a second attempt
  /// (a re-start) is unsuccessful.
  ///
  /// In en, this message translates to:
  /// **'When a second attempt (a re-start) is unsuccessful.'**
  String get penalty9;

  /// Penalty 10 - D6.28 - If a diver refuses the execution of a dive.
  ///
  /// In en, this message translates to:
  /// **'If a diver refuses the execution of a dive.'**
  String get penalty10;

  /// Penalty 11 - D9.2 & D9.9 - In synchronised diving if a diver, or both divers, perform a dive of a different number or position.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving if a diver, or both divers, perform a dive of a different number.'**
  String get penalty11;

  /// Penalty 12 - D9.8 - In synchronised diving if all execution judges for one diver award zero (0) points.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving if all execution judges for one diver award zero (0) points.'**
  String get penalty12;

  /// Penalty 13 - D9.10 - In synchronised diving if all synchronisation judges award zero (0) points.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving if all synchronisation judges award zero (0) points.'**
  String get penalty13;

  /// Penalty 14 - D9.8 & 9.9 - If an execution judge considers that a dive of a different number has been performed.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving if a diver, or both divers, perform a dive of a different position.'**
  String get penalty14;

  /// Penalty 15 - D9.5 - In synchronised diving if either diver enters the surface of the water before the other diver leaves the springboard or platform.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving if either diver enters the surface of the water before the other diver leaves the springboard or platform.'**
  String get penalty15;

  /// Penalty 16 - D6.25 - If a diver takes a step and stops in a running dive or stops the movement for a standing take-off after the legs have commenced to press.
  ///
  /// In en, this message translates to:
  /// **'If a diver takes a step and stops in a running dive or stops the movement for a standing take-off after the legs have commenced to press.'**
  String get penalty16;

  /// Penalty 17 - D6.26 - If there is a
  /// re-start in a standing, running, or armstand dive.
  ///
  /// In en, this message translates to:
  /// **'If there is a re-start in a standing, running, or armstand dive.'**
  String get penalty17;

  /// Penalty 18 - D9.6 - In synchronised diving if there is a re-start by one or both divers.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving if there is a re-start by one or both divers.'**
  String get penalty18;

  /// Penalty 19 - D6.19 & D8.1.4 - If a diver performs a dive in a position other than that announced.
  ///
  /// In en, this message translates to:
  /// **'If a diver performs a dive in a position other than that announced.'**
  String get penalty19;

  /// Penalty 20 - D8.5.4 - If in a dive, a diver is unsafely close to the springboard or platform or touches the end of the springboard or platform with his head.
  ///
  /// In en, this message translates to:
  /// **'If in a dive, a diver is unsafely close to the springboard or platform or touches the end of the springboard or platform with his head.'**
  String get penalty20;

  /// Penalty 21 - D6.22, D8.6.3 & D8.6.4 - If a diver has one or both arms held above the head in a feet first entry or below the head in a head first entry.
  ///
  /// In en, this message translates to:
  /// **'If a diver has one or both arms held above the head in a feet first entry or below the head in a head first entry.'**
  String get penalty21;

  /// Penalty 22 - D8.5.7 - If in a flying dive, a straight position is not clearly shown for at least one quarter of a somersault (90º) in dives with somersault.
  ///
  /// In en, this message translates to:
  /// **'If in a flying dive, a straight position is not clearly shown for at least one quarter of a somersault (90º) in dives with somersault.'**
  String get penalty22;

  /// Penalty 23 - D8.5.7 - If in a flying dive, a straight position is not clearly shown for at least a half somersault (180º) in dives with more than 1 somersault.
  ///
  /// In en, this message translates to:
  /// **'If in a flying dive, a straight position is not clearly shown for at least a half somersault (180º) in dives with more than 1 somersault.'**
  String get penalty23;

  /// Penalty 24 - D8.1.6 - If a dive is not performed in a position as described.
  ///
  /// In en, this message translates to:
  /// **'If a dive is not performed in a position as described in the rules.'**
  String get penalty24;

  /// Penalty 25 - D8.2.3 - If the starting position is not straight, head erect, with the arms straight in any position.
  ///
  /// In en, this message translates to:
  /// **'If the starting position is not straight, head erect, with the arms straight in any position.'**
  String get penalty25;

  /// Penalty 26 - D8.2.4.3 - If the feet leave the springboard or platform (crow-hop) before the take-off in a standing dive.
  ///
  /// In en, this message translates to:
  /// **'If the feet leave the springboard or platform (crow-hop) before the take-off in a standing dive.'**
  String get penalty26;

  /// Penalty 27 - D8.2.6.2 - If in an armstand dive, a stationary and steady balance in the straight vertical position is not shown.
  ///
  /// In en, this message translates to:
  /// **'If in an armstand dive, a stationary and steady balance in the straight vertical position is not shown.'**
  String get penalty27;

  /// Penalty 28 - D8.3.2 - If the run is not smooth, aesthetically pleasing in a forward direction to the end of the springboard or platform.
  ///
  /// In en, this message translates to:
  /// **'If the run is not smooth, aesthetically pleasing in a forward direction to the end of the springboard or platform.'**
  String get penalty28;

  /// Penalty 29 - D8.4.5 - If the take-off is not bold, high, and confident.
  ///
  /// In en, this message translates to:
  /// **'If the take-off is not bold, high, and confident.'**
  String get penalty29;

  /// Penalty 30 - D8.4.6 - If in a twist dive, the twisting is manifestly done from the springboard or platform.
  ///
  /// In en, this message translates to:
  /// **'If in a twist dive, the twisting is manifestly done from the springboard or platform.'**
  String get penalty30;

  /// Penalty 31 - D8.5.6 - If the straight position is not shown as described.
  ///
  /// In en, this message translates to:
  /// **'If the straight position is not shown as described in the rules.'**
  String get penalty31;

  /// Penalty 32 - D8.5.9 - If the pike position is not shown as described.
  ///
  /// In en, this message translates to:
  /// **'If the pike position is not shown as described in the rules.'**
  String get penalty32;

  /// Penalty 33 - D8.5.10 - If in a pike dive with twist, the pike position is not clearly shown.
  ///
  /// In en, this message translates to:
  /// **'If in a pike dive with twist, the pike position is not clearly shown.'**
  String get penalty33;

  /// Penalty 34 - D8.5.12 - If the tuck position is not shown as described.
  ///
  /// In en, this message translates to:
  /// **'If the tuck position is not shown as described in the rules.'**
  String get penalty34;

  /// Penalty 35 - D8.5.13 - If in a tuck dive with twist, the tuck position is not clearly shown.
  ///
  /// In en, this message translates to:
  /// **'If in a tuck dive with twist, the tuck position is not clearly shown.'**
  String get penalty35;

  /// Penalty 36 - D8.5.15 - If the free position is not shown as described.
  ///
  /// In en, this message translates to:
  /// **'If the free position is not shown as described in the rules.'**
  String get penalty36;

  /// Penalty 37 - D8.6.5 - If the arms are not in the correct position in either the head first or feet first entry.
  ///
  /// In en, this message translates to:
  /// **'If the arms are not in the correct position in either the head first or feet first entry.'**
  String get penalty37;

  /// Penalty 38 - D9.11 - In synchronised diving if similarity of the starting position, approach, take-off and height is not shown.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving if similarity of the starting position, approach, take-off and height is not shown.'**
  String get penalty38;

  /// Penalty 39 - D9.11 - In synchronised diving if coordinated timing of the movement during the flight is not shown.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving if coordinated timing of the movement during the flight is not shown.'**
  String get penalty39;

  /// Penalty 40 - D9.11 - In synchronised diving if similarity of the vertical angles of the entries is not shown.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving if similarity of the vertical angles of the entries is not shown.'**
  String get penalty40;

  /// Penalty 41 - D9.11 - In synchronised diving if comparative distance from the springboard or platform of the entry is not shown.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving if comparative distance from the springboard or platform of the entry is not shown.'**
  String get penalty41;

  /// Penalty 42 - D9.11 - In synchronised diving if coordinated timing of the entries is not shown.
  ///
  /// In en, this message translates to:
  /// **'In synchronised diving if coordinated timing of the entries is not shown.'**
  String get penalty42;

  /// Penalty 43 - D8.1.5 - If a dive is performed partially in a position other than that announced.
  ///
  /// In en, this message translates to:
  /// **'If a dive is performed partially in a position other than that announced.'**
  String get penalty43;

  /// Penalty 44 - D8.5.2 - If in a dive, the diver dives to the side of the direct line of flight.
  ///
  /// In en, this message translates to:
  /// **'If in a dive, the diver dives to the side of the direct line of flight.'**
  String get penalty44;

  /// Penalty 45 - D8.5.3 - If in a dive, a diver touches the end of the springboard or platform with his feet or hands.
  ///
  /// In en, this message translates to:
  /// **'If in a dive, a diver touches the end of the springboard or platform with his feet or hands.'**
  String get penalty45;

  /// Penalty 46 - D8.6.2 - If the entry into the water is not vertical, or nearly so.
  ///
  /// In en, this message translates to:
  /// **'If the entry into the water is not vertical, or nearly so.'**
  String get penalty46;

  /// Penalty 47 - D8.6.2 - If the entry into the water is twisted.
  ///
  /// In en, this message translates to:
  /// **'If the entry into the water is twisted.'**
  String get penalty47;

  /// Penalty 48 - D8.6.2 - If in the entry into the water the body is not straight.
  ///
  /// In en, this message translates to:
  /// **'If in the entry into the water the body is not straight.'**
  String get penalty48;

  /// Penalty 49 - D8.6.2 - If the entry into the water the feet are not together, and the toes not pointed.
  ///
  /// In en, this message translates to:
  /// **'If in the entry into the water the feet are not together, and the toes not pointed.'**
  String get penalty49;

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
  /// **'Current Rulebook: World Aquatics - 1st July 2025 - v6'**
  String get aboutRulesLocal;

  /// About - Rules Reference
  ///
  /// In en, this message translates to:
  /// **'Rules for the app: World Aquatics - 1st July 2025 - v6'**
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
      'that was used.');
}
