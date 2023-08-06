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
          const SizedBox(
              width: 72), // 36x2 the 2 action icons in the header bar
          SvgPicture.asset(
            "assets/images/diving_rules_22_logo_horizontal.svg",
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary, BlendMode.srcIn),
            height: 35,
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
