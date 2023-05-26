import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:flutter_svg/svg.dart';

class DivingRulesLogo extends StatelessWidget {
  bool small;

  DivingRulesLogo({Key? key, required this.small}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (small == true) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 32),
          // use an svg format to switch color based on light/dark
          // Image.asset('assets/images/diving_rules_22_logo_diver.png', height: 30,),
          SvgPicture.asset(
            "assets/images/diving_rules_22_logo_diver.svg",
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary, BlendMode.srcIn),
            width: 25,
          ),
          const SizedBox(width: 4),
          RichText(
              text: TextSpan(
            style: Theme.of(context).textTheme.titleLarge,
            children: [
              TextSpan(
                  text: AppLocalizations.of(context)!.cFBundleName,
                  style: TextStyle(color: Theme.of(context).colorScheme.primary)
                  // style: Theme.of(context).textTheme.titleLarge,
                  ),
            ],
          )),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // use an svg format to switch color based on light/dark
          // Image.asset('assets/images/diving_rules_22_logo_diver.png', height: 30,),
          SvgPicture.asset(
            "assets/images/diving_rules_22_logo_diver.svg",
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary, BlendMode.srcIn),
            width: 35,
          ),
          const SizedBox(width: 8),
          RichText(
              text: TextSpan(
            style: Theme.of(context).textTheme.headlineMedium,
            children: [
              TextSpan(
                  text: AppLocalizations.of(context)!.cFBundleDisplayName,
                  style: TextStyle(color: Theme.of(context).colorScheme.primary)
                  // style: Theme.of(context).textTheme.titleLarge,
                  ),
            ],
          )),
        ],
      );
    }
  }
}
