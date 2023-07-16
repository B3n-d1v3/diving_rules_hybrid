import 'package:diving_rules_hybrid/models/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';

import '../models/token_spacing.dart';

class OwnershipContent extends StatefulWidget {
  int buttonType;
  int penaltyIndex;
  int viewMode;

  // vieMode 0 = Penalty View
  // vieMode 1 = Quiz Question View
  // vieMode 2 = Quiz Answer Correction View

  OwnershipContent(
      {required this.buttonType,
      required this.penaltyIndex,
      required this.viewMode});

  @override
  _OwnershipContentState createState() => _OwnershipContentState();
}

class _OwnershipContentState extends State<OwnershipContent> {
  @override
  Widget build(BuildContext context) {
    switch (widget.buttonType) {
      case 0:
        return Column(
          children: [
            Icon(CupertinoIcons.person_crop_circle_badge_exclam,
                size: 40,
                color: widget.viewMode != 0
                    ? currentPenaltyStatus.ownershipReferee.value
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary
                    : penaltySummary.penalties[widget.penaltyIndex].referee
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary),
            // To adjust non symetric sized icons for both ownership
            SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.buttonReferee,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: widget.viewMode != 0
                      ? currentPenaltyStatus.ownershipReferee.value
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary
                      : penaltySummary.penalties[widget.penaltyIndex].referee
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary),
            ),
            SizedBox(height: DRSpacing.xs),
            Divider(
              height: DRSpacing.xs,
              thickness: 3,
              indent: DRSpacing.x5l,
              endIndent: DRSpacing.x5l,
              color: ((widget.viewMode != 0 &&
                          currentPenaltyStatus.ownershipReferee.value) ||
                      (widget.viewMode == 0 &&
                          penaltySummary
                              .penalties[widget.penaltyIndex].referee))
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.background,
            ),
            SizedBox(height: DRSpacing.xs),
          ],
        );
        break;
      case 1:
        return Column(
          children: [
            Icon(CupertinoIcons.person_3_fill,
                size: 50,
                color: widget.viewMode != 0 //widget.isSelected
                    ? currentPenaltyStatus.ownershipJudge.value
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary
                    : penaltySummary.penalties[widget.penaltyIndex].judge
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary),
            //SizedBox(height: 4),
            Text(
              AppLocalizations.of(context)!.buttonJudge,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: widget.viewMode != 0 //widget.isSelected
                      ? currentPenaltyStatus.ownershipJudge.value
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary
                      : penaltySummary.penalties[widget.penaltyIndex].judge
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary),
            ),

            SizedBox(height: DRSpacing.xs),

            Divider(
              height: DRSpacing.xs,
              thickness: 3,
              indent: DRSpacing.x5l,
              endIndent: DRSpacing.x5l,
              color: ((widget.viewMode != 0 &&
                          currentPenaltyStatus.ownershipJudge.value) ||
                      (widget.viewMode == 0 &&
                          penaltySummary.penalties[widget.penaltyIndex].judge))
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.background,
            ),

            SizedBox(height: DRSpacing.xs),
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
