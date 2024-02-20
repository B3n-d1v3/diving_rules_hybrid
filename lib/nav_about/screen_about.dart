import 'package:diving_rules_hybrid/models/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/token_spacing.dart';
import '../sub_views/diving_rules_logo.dart';

class ScreenAbout extends StatefulWidget {
  const ScreenAbout({Key? key}) : super(key: key);

  @override
  State<ScreenAbout> createState() => _ScreenAboutState();
}

class _ScreenAboutState extends State<ScreenAbout> {
  // Package Version instantiation
  PackageInfo _packageInfo = PackageInfo(
      appName: 'Unknown',
      packageName: 'Unknown',
      version: 'Unknown',
      buildNumber: 'Unknown');

  @override
  void initState() {
    // debugPrint('>>>> ScreenAbout > initState in > currentPage: "${currentPage}"');
    // Setup to check if the user is calling the search from within the rule book page
    currentPage = 'about';
    // could be 'start', 'rulebook', 'penalties', 'quiz', 'about'
    // debugPrint('>>>> ScreenAbout > initState out > currentPage: "${currentPage}"');
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                /// Diving Board Photo
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset('assets/images/diving_board.png',
                        fit: BoxFit.fitWidth)),

                Padding(
                  padding: EdgeInsets.all(DRSpacing.l),
                  child: Column(children: [
                    /// Diving Rules Logo
                    DivingRulesLogo(small: false),

                    SizedBox(height: DRSpacing.s),

                    /// Version
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "${AppLocalizations.of(context)!.aboutVersion}v${_packageInfo.version} (build ${_packageInfo.buildNumber})",
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.start,
                      ),
                    ),

                    /// World Aquatics Rules Reference version
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppLocalizations.of(context)!.aboutRulesReference,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),

                    SizedBox(
                      height: DRSpacing.xl,
                    ),

                    /// App Description
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppLocalizations.of(context)!.aboutDescriptionTitle,
                        style: Theme.of(context).textTheme.titleMedium,

                        //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, height: 2, color: primaryColor),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.aboutDescription,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: DRSpacing.xl,
                    ),

                    /// World Aquatics link
                    // link to WA: https://www.worldaquatics.com/diving
                    OutlinedButton(
                        onPressed: () async {
                          Uri waUrl =
                              Uri.parse("http://www.worldaquatics.com/diving");
                          if (await launchUrl(waUrl,
                              mode: LaunchMode.externalApplication)) {
                            //browsing app opened
                          } else {
                            //browsing app did not opened
                          }
                        },
                        child: Text(
                          'World Aquatics',
                          style: Theme.of(context).textTheme.bodyMedium,
                          // style: TextStyle(color: Theme.of(context).colorScheme.primary,)
                        )),

                    SizedBox(
                      height: DRSpacing.m,
                    ),

                    Divider(),

                    SizedBox(
                      height: DRSpacing.xl,
                    ),

                    /// License
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppLocalizations.of(context)!.aboutLicenseTitle,
                        style: Theme.of(context).textTheme.titleMedium,
                        //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, height: 2),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.aboutLicense,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                    SizedBox(
                      height: DRSpacing.xl,
                    ),

                    Divider(),

                    SizedBox(
                      height: DRSpacing.xl,
                    ),

                    /// Thanks
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppLocalizations.of(context)!.aboutThanksTitle,
                        style: Theme.of(context).textTheme.titleMedium,
                        //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, height: 2),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.aboutThanks,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                    SizedBox(
                      height: DRSpacing.x3l,
                    ),

                    Divider(),

                    SizedBox(
                      height: DRSpacing.xl,
                    ),

                    /// Share
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppLocalizations.of(context)!.aboutShareTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                        //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, height: 2),
                      ),
                    ),

                    SizedBox(
                      height: DRSpacing.m,
                    ),

                    /// QR Code
                    GestureDetector(
                      onTap: () async {
                        Uri appUrl = Uri.parse("http://bit.ly/GetDivingRules");
                        if (await launchUrl(appUrl,
                            mode: LaunchMode.externalApplication)) {
                          //browsing app opened
                        } else {
                          //browsing app did not opened
                        }
                      },
                      child: SvgPicture.asset(
                        "assets/images/diving_rules_22_qr_code.svg",
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.primary,
                            BlendMode.srcIn),
                        width: 150,
                        height: 150,
                      ),
                    ),

                    SizedBox(height: DRSpacing.xl),

                    /// Share Button
                    OutlinedButton.icon(
                      onPressed: () {
                        Share.share(
                            'I 😍 this app to learn the Diving Rules: http://bit.ly/GetDivingRules',
                            subject: 'diving rules app');
                      },
                      icon: const Icon(
                        CupertinoIcons.share,
                        size: 24.0,
                      ),
                      label: Text(AppLocalizations.of(context)!.aboutShare,
                          style: const TextStyle(fontWeight: FontWeight.w900)),
                    ),

                    SizedBox(
                      height: DRSpacing.x3l,
                    ),

                    Divider(),

                    SizedBox(
                      height: DRSpacing.xl,
                    ),

                    /// Feedback Contacts
                    Column(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          AppLocalizations.of(context)!.aboutFeedbackTitle,
                          style: Theme.of(context).textTheme.titleMedium,
                          //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, height: 2),
                          //padding: const EdgeInsets.all(50),
                        ),
                      ),
                      SizedBox(
                        height: DRSpacing.l,
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            foregroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary),
                        // Link to the github issues page
                        onPressed: () async {
                          Uri waUrl = Uri.parse(
                              "https://github.com/B3n-d1v3/diving_rules_hybrid/discussions/categories/general");
                          if (await launchUrl(waUrl,
                              mode: LaunchMode.externalApplication)) {
                            //browsing app opened
                          } else {
                            //browsing app did not opened
                          }
                        },
                        // mail link
                        // onPressed: () async {
                        //   String email =
                        //       Uri.encodeComponent("BenDivingJudge@gmail.com");
                        //   String subject =
                        //       Uri.encodeComponent("Diving Rules 22 - Feedback");
                        //   String body = Uri.encodeComponent(
                        //       "Please provide your feedback here.");
                        //   Uri mail = Uri.parse(
                        //       "mailto:$email?subject=$subject&body=$body");
                        //   if (await launchUrl(mail)) {
                        //     //email app opened
                        //   } else {
                        //     //email app is not opened
                        //   }
                        // },
                        icon: const Icon(
                          // CupertinoIcons.mail_solid, // envelope_circle
                          CupertinoIcons.chat_bubble_text_fill,
                          size: 24.0,
                        ),
                        label: Text(
                            AppLocalizations.of(context)!.aboutFeedbackLink,
                            style: const TextStyle(
                                fontWeight: FontWeight.w900)), // <-- Text
                      ),
                    ]),

                    // TODO: Add a share header bar icon + share link
                    // shareText = "I 😍 this app to learn the Diving Rules"
                    // for apple: URL(string : "bit.ly/DivingRulesApp")
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),

      // Typography tests
      // TextButton(
      //     onPressed: () {
      //       Get.to(
      //         TestTextStyles(),
      //         transition: Transition.rightToLeftWithFade,
      //       );
      //     },
      //     child: Center(child: Text('Test Typography'))),
    );
  }
}
