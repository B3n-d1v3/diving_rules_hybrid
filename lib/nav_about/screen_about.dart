import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
            child: Padding(
              padding: EdgeInsets.all(15),
              // margin: const EdgeInsets.all(10),
              child: Column(children: [
                Image.asset(
                  'assets/images/diving-rules-logo-3.png',
                  height: 200,
                ),

                const SizedBox(
                  height: 20,
                ),

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

                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    AppLocalizations.of(context)!.aboutDescriptionTitle,
                    style: Theme.of(context).textTheme.titleLarge,

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

                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    AppLocalizations.of(context)!.aboutLicenseTitle,
                    style: Theme.of(context).textTheme.titleSmall,
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

                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    AppLocalizations.of(context)!.aboutThanksTitle,
                    style: Theme.of(context).textTheme.titleSmall,
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

                Column(children: [
                  Text(
                    AppLocalizations.of(context)!.aboutContactTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                    //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, height: 2),
                    //padding: const EdgeInsets.all(50),
                  ),
                  Text(
                    AppLocalizations.of(context)!.aboutContactLink,
                    style: Theme.of(context).textTheme.bodyMedium,
                    // TODO: Open a send mail
                    // to = "BenDivingJudge@gmail.com"
                    // let subject = "Diving Rules Feedback"
                    // let body =  "Please provide your feedback here."
                  ),
                ]),

                const SizedBox(
                  height: 30,
                ),

                Text(
                  AppLocalizations.of(context)!.aboutShareTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                  //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, height: 2),
                ),
                Text(
                  AppLocalizations.of(context)!.aboutShare,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                // TODO: Create New and add the QR code image

                // TODO: Add a share header bar icon + share link
                // shareText = "I 😍 this app to learn the Diving Rules"
                // for apple: URL(string : "bit.ly/DivingRulesApp")
              ]),
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
