import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DivingRulesLogo extends StatelessWidget {
  bool small;
  bool leftAligned;

  DivingRulesLogo({super.key, required this.small, this.leftAligned = false});

  @override
  Widget build(BuildContext context) {
    if (small == true) {
      return Row(
        mainAxisAlignment:
            !leftAligned ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          if (!leftAligned) ...[
            const SizedBox(
              width: 72, //80, // size of the 2 actions buttons
            ),
          ],
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
        // "assets/images/diving_rules_22_logo_horizontal_22-25.svg",
        "assets/images/diving_rules_22_logo_horizontal.svg",
        colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.primary, BlendMode.srcIn),
        height: 45,
      );
    }
  }
}
