import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';

import '../theme/dr_colors.dart';

class OwnershipButton extends StatefulWidget {
  int buttonType;
  bool isSelected;

  OwnershipButton({required this.buttonType, required this.isSelected});

  @override
  _OwnershipButtonState createState() => _OwnershipButtonState();
}

class _OwnershipButtonState extends State<OwnershipButton> {
  @override
  Widget build(BuildContext context) {
    switch (widget.buttonType) {
      case 0:
        return Column(
          children: [
            Icon(CupertinoIcons.person_crop_circle_badge_exclam,
                size: 40,
                color: widget.isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.tertiary),
            SizedBox(height: 9),
            Text(
              AppLocalizations.of(context)!.buttonReferee,
              style: TextStyle(
                  color: widget.isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.tertiary),
            ),
            SizedBox(height: 4),
            if (widget.isSelected) ...{
              Divider(
                height: 3,
                thickness: 3,
                indent: 45,
                endIndent: 45,
                color: Theme.of(context).colorScheme.primary,
              ),
            },
            SizedBox(height: 4),
          ],
        );
        break;
      case 1:
        return Column(
          children: [
            Icon(CupertinoIcons.person_3_fill,
                size: 50,
                color: widget.isSelected
                    ? Theme.of(context).colorScheme.primary
                    : AppColor.drColorDeselectedLight),
            //SizedBox(height: 4),
            Text(
              AppLocalizations.of(context)!.buttonJudge,
              style: TextStyle(
                  color: widget.isSelected
                      ? Theme.of(context).colorScheme.primary
                      : AppColor.drColorDeselectedLight),
            ),
            SizedBox(height: 4),
            if (widget.isSelected) ...{
              Divider(
                height: 3,
                thickness: 3,
                indent: 45,
                endIndent: 45,
                color: Theme.of(context).colorScheme.primary,
              ),
            },
            SizedBox(height: 4),
          ],
        );
        break;
      default:
        return Text(' ');
    }
  }
}

//  Button ID Correspondance
//    0 > Referee > icon: person_fill (or profile_circled, person_crop_circle_badge_exclam)
//    1 > Judges > icon: person_3_fill, group_solid
