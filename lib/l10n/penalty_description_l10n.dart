import 'package:flutter/material.dart';

import 'diving_rules_localizations.dart';

class PenaltyDescription extends StatefulWidget {
  int penaltyId;

  PenaltyDescription({super.key, required this.penaltyId});

  @override
  _PenaltyDescriptionState createState() => _PenaltyDescriptionState();
}

class _PenaltyDescriptionState extends State<PenaltyDescription> {
  @override
  Widget build(BuildContext context) {
    switch (widget.penaltyId) {
      case 0:
        return Text(AppLocalizations.of(context)!.penalty0,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 1:
        return Text(AppLocalizations.of(context)!.penalty1,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 2:
        return Text(AppLocalizations.of(context)!.penalty2,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 3:
        return Text(AppLocalizations.of(context)!.penalty3,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 4:
        return Text(AppLocalizations.of(context)!.penalty4,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 5:
        return Text(AppLocalizations.of(context)!.penalty5,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 6:
        return Text(AppLocalizations.of(context)!.penalty6,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 7:
        return Text(AppLocalizations.of(context)!.penalty7,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 8:
        return Text(AppLocalizations.of(context)!.penalty8,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 9:
        return Text(AppLocalizations.of(context)!.penalty9,
            style: Theme.of(context).textTheme.bodyLarge);
        break;

      case 10:
        return Text(AppLocalizations.of(context)!.penalty10,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 11:
        return Text(AppLocalizations.of(context)!.penalty11,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 12:
        return Text(AppLocalizations.of(context)!.penalty12,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 13:
        return Text(AppLocalizations.of(context)!.penalty13,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 14:
        return Text(AppLocalizations.of(context)!.penalty14,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 15:
        return Text(AppLocalizations.of(context)!.penalty15,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 16:
        return Text(AppLocalizations.of(context)!.penalty16,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 17:
        return Text(AppLocalizations.of(context)!.penalty17,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 18:
        return Text(AppLocalizations.of(context)!.penalty18,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 19:
        return Text(AppLocalizations.of(context)!.penalty19,
            style: Theme.of(context).textTheme.bodyLarge);
        break;

      case 20:
        return Text(AppLocalizations.of(context)!.penalty20,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 21:
        return Text(AppLocalizations.of(context)!.penalty21,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 22:
        return Text(AppLocalizations.of(context)!.penalty22,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 23:
        return Text(AppLocalizations.of(context)!.penalty23,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 24:
        return Text(AppLocalizations.of(context)!.penalty24,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 25:
        return Text(AppLocalizations.of(context)!.penalty25,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 26:
        return Text(AppLocalizations.of(context)!.penalty26,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 27:
        return Text(AppLocalizations.of(context)!.penalty27,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 28:
        return Text(AppLocalizations.of(context)!.penalty28,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 29:
        return Text(AppLocalizations.of(context)!.penalty29,
            style: Theme.of(context).textTheme.bodyLarge);
        break;

      case 30:
        return Text(AppLocalizations.of(context)!.penalty30,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 31:
        return Text(AppLocalizations.of(context)!.penalty31,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 32:
        return Text(AppLocalizations.of(context)!.penalty32,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 33:
        return Text(AppLocalizations.of(context)!.penalty33,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 34:
        return Text(AppLocalizations.of(context)!.penalty34,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 35:
        return Text(AppLocalizations.of(context)!.penalty35,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 36:
        return Text(AppLocalizations.of(context)!.penalty36,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 37:
        return Text(AppLocalizations.of(context)!.penalty37,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 38:
        return Text(AppLocalizations.of(context)!.penalty38,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 39:
        return Text(AppLocalizations.of(context)!.penalty39,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 40:
        return Text(AppLocalizations.of(context)!.penalty40,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 41:
        return Text(AppLocalizations.of(context)!.penalty41,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 42:
        return Text(AppLocalizations.of(context)!.penalty42,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 43:
        return Text(AppLocalizations.of(context)!.penalty43,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 44:
        return Text(AppLocalizations.of(context)!.penalty44,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 45:
        return Text(AppLocalizations.of(context)!.penalty45,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 46:
        return Text(AppLocalizations.of(context)!.penalty46,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 47:
        return Text(AppLocalizations.of(context)!.penalty47,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 48:
        return Text(AppLocalizations.of(context)!.penalty48,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 49:
        return Text(AppLocalizations.of(context)!.penalty49,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 50:
        return Text(AppLocalizations.of(context)!.penalty50,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 51:
        return Text(AppLocalizations.of(context)!.penalty51,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 52:
        return Text(AppLocalizations.of(context)!.penalty52,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 53:
        return Text(AppLocalizations.of(context)!.penalty53,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 54:
        return Text(AppLocalizations.of(context)!.penalty54,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 55:
        return Text(AppLocalizations.of(context)!.penalty55,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 56:
        return Text(AppLocalizations.of(context)!.penalty56,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 57:
        return Text(AppLocalizations.of(context)!.penalty57,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 58:
        return Text(AppLocalizations.of(context)!.penalty58,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 59:
        return Text(AppLocalizations.of(context)!.penalty59,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 60:
        return Text(AppLocalizations.of(context)!.penalty60,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 61:
        return Text(AppLocalizations.of(context)!.penalty61,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case 62:
        return Text(AppLocalizations.of(context)!.penalty62,
            style: Theme.of(context).textTheme.bodyLarge);
        break;
      case -1: // safe guard for unused case
        return Text(' ');
        break;

      default:
        return Text(' ');
    }
  }
}
