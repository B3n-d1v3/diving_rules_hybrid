import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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
                // Diving Board Photo
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset('assets/images/diving_board.png',
                        fit: BoxFit.fitWidth)),

                Padding(
                  padding: EdgeInsets.all(15),
                  // margin: const EdgeInsets.all(10),
                  child: Column(children: [
                    DivingRulesLogo(small: false),
                    // Image.asset('assets/images/diving_rules_22_logo_full.png', height: 180,),

                    const SizedBox(height: 8),

                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(children: [
                        Text(
                          AppLocalizations.of(context)!.aboutVersion,
                          style: Theme.of(context).textTheme.labelMedium,
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "v${_packageInfo.version} (build ${_packageInfo.buildNumber})",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ]),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppLocalizations.of(context)!.aboutRulesReference,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // Description
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

                    const SizedBox(
                      height: 20,
                    ),

                    Divider(),

                    const SizedBox(
                      height: 20,
                    ),

                    // License
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
                      style: Theme.of(context).textTheme.bodySmall,
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    Divider(),

                    const SizedBox(
                      height: 20,
                    ),

                    // Thanks
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
                      style: Theme.of(context).textTheme.bodySmall,
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    Divider(),

                    const SizedBox(
                      height: 20,
                    ),
                    // Share Links
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppLocalizations.of(context)!.aboutShareTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                        //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, height: 2),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // TODO: Create New and add the QR code image

                    const SizedBox(
                      height: 20,
                    ),

                    ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Create Native OS Share option => testing with share_plus
                        //Share.share('I 😍 this app to learn the Diving Rules: http://bit.ly/DivingRulesApp', subject: 'diving rules');
                      },
                      icon: const Icon(
                        CupertinoIcons.share,
                        size: 24.0,
                      ),
                      label: Text(AppLocalizations.of(context)!.aboutShare),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    Divider(),

                    const SizedBox(
                      height: 20,
                    ),

                    // Contact Links
                    Column(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          AppLocalizations.of(context)!.aboutContactTitle,
                          style: Theme.of(context).textTheme.titleLarge,
                          //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, height: 2),
                          //padding: const EdgeInsets.all(50),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton.icon(
                        onPressed: () async {
                          String email =
                              Uri.encodeComponent("BenDivingJudge@gmail.com");
                          String subject =
                              Uri.encodeComponent("Diving Rules 22 - Feedback");
                          String body = Uri.encodeComponent(
                              "Please provide your feedback here.");
                          print(subject); //output: Hello%20Flutter
                          Uri mail = Uri.parse(
                              "mailto:$email?subject=$subject&body=$body");
                          if (await launchUrl(mail)) {
                            //email app opened
                          } else {
                            //email app is not opened
                          }
                        },
                        icon: const Icon(
                          CupertinoIcons.mail_solid, // envelope_circle
                          size: 24.0,
                        ),
                        label: Text(AppLocalizations.of(context)!
                            .aboutContactLink), // <-- Text
                      ),
                    ]),

                    const SizedBox(
                      height: 30,
                    ),

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
