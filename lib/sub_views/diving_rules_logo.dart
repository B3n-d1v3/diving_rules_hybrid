import 'package:flutter/material.dart';
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
          const SizedBox(width: 36),
          SvgPicture.asset(
            "assets/images/diving_rules_22_logo_horizontal.svg",
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary, BlendMode.srcIn),
            height: 30,
          ),
        ],
      );
    } else {
      return SvgPicture.asset(
        "assets/images/diving_rules_22_logo_horizontal_22-25.svg",
        colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.primary, BlendMode.srcIn),
        height: 45,
      );
    }
  }
}
