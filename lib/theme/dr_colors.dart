import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  // World Aquatics colors
  static const Color waColorMidBlue = Color(0xFF176CED);
  static const Color waColorDarkBlue = Color(0xFF0000BC);
  static const Color waColorDarkGrey = Color(0xFF5B6670);
  static const Color waColorMidGrey = Color(0xFF8997A8);
  static const Gradient waColorGradientLight = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xff2DB5EF),
      Color(0xff1756ED),
    ],
  );
  static const Gradient waColorGradientDark = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xff0500EF),
      Color(0xff000080),
    ],
  );
  static const Gradient waColorGradientSilver = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xffC7C7C7),
      Color(0xff5B6671),
    ],
  );
  static const Color waColorDivingSolid = Color(0xFF363A8B);
  static const Gradient waColorDivingGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xff1120BC),
      Color(0xff3030A3),
    ],
  );

  // App colors from iOS + Accessible
  // static const Color dr_primary_light = Color(0xFF005A94);
  // static const Color dr_primary_dark = Color(0xFF009AFF);
  // static const Color dr_secondary_light = Color(0xFF009AFF);
  // static const Color dr_secondary_dark = Color(0xFF005994);
  // static const Color dr_positive_light = Color(0xFF006600);
  // static const Color dr_positive_dark = Color(0xFF00C300);
  // static const Color dr_negative_light = Color(0xFFAC0000);
  // static const Color dr_negative_dark = Color(0xFFFF614D);
  // static const Color dr_deselected_light = Color(0xFF575757);
  // static const Color dr_deselected_dark = Color(0xFF969696);

  // Non Material
  static const Color drColorPositiveLight = Color(0xFF006600);
  static const Color drColorNegativeLight = Color(0xffAC0000);
  static const Color drColorDeselectedLight = Color(0xFF575757);

  // New App
  // Light Mode
  static const Color myBackgroundColorLight = Color(0xffffffff);
  static const Color myOnBackgroundColorLight = Color(0xff000000);

  static const Color myPrimaryColorLight = waColorDivingSolid;
  static const Color myOnPrimaryColorLight = Color(0xFFFFFFFF);
  static const Color mySecondaryColorLight = Color(0xFF005A94);
  static const Color myOnSecondaryColorLight = Color(0xFFFFFFFF);

  // static const Color myTertiaryColorLight = Color(0xFF009AFF);
  static const Color myTertiaryColorLight = drColorDeselectedLight;
  static const Color myOnTertiaryColorLight = Color(0xFFFFFFFF);

  static const Color mySurfaceColorLight = Color(0xffffffff);
  static const Color myOnSurfaceColorLight = Color(0xff000000);
  static const Color myErrorColorLight = drColorNegativeLight;
  static const Color myOnErrorColorLight = Color(0xffFFFFFF);

  static const Color myPrimaryContainerColorLight =
      // Colors.red;
      Color(0xFFe1e0ff);
  static const Color myOnPrimaryContainerColorLight = Color(0xFF070764);
  static const Color mySecondaryContainerColorLight = Color(0xFFD1E4FF);
  static const Color myOnSecondaryContainerColorLight = Color(0xFF001D36);
  static const Color myTertiaryContainerColorLight = Color(0xFFD1E4FF);
  static const Color myOnTertiaryContainerColorLight = Color(0xFF001D36);
  static const Color myErrorContainerColorLight = Color(0xFFFFDAD6);
  static const Color myOnErrorContainerColorLight = Color(0xFF410002);

  // static const Color myPrimaryVariantColorLight = Color(0xff7b1fa2); //
  // static const Color mySecondaryVariantColorLight = Color(0xff26a69a); //
  // const Color myBarBackgroundColorLight = Color(0xff6a1b9a); //
  // const Color myScaffoldBackgroundColorLight = Color(0xff4a148c); //

  // surfaceVariant: Color(0xFFDFE3EB),
  // onSurfaceVariant: Color(0xFF42474E),
  // outline: Color(0xFF73777F),
  // onInverseSurface: Color(0xFFD6F6FF),
  // inverseSurface: Color(0xFF00363F),
  // inversePrimary: Color(0xFF9CCAFF),
  // shadow: Color(0xFF000000),
  // surfaceTint: Color(0xFF0062A0),
  // outlineVariant: Color(0xFFC2C7CF),
  // scrim: Color(0xFF000000),

  // Dark Mode
  static const Color drPrimaryDark = Color(0xFF009AFF);
  static const Color drSecondaryDark = Color(0xFF005994);

  static const Color drColorPositiveDark = Color(0xFF00C300); // #81db6e
  static const Color drColorNegativeDark = Color(0xFFFF614D); // #ffb4a8
  static const Color drColorDeselectedDark = Color(0xFF969696);

  static const Color myBackgroundColorDark = Color(0xff000000);
  static const Color myOnBackgroundColorDark = Color(0xffffffff);

  static const Color myPrimaryColorDark = Color(
      0xFF6B93EB); // Material Theme builder proposition: #bfc1ff (from https://m3.material.io/theme-builder#/custom )
  static const Color myOnPrimaryColorDark = Color(0xFF000000);
  static const Color mySecondaryColorDark = Color(0xFF009AFF); // #9ccaff
  static const Color myOnSecondaryColorDark = Color(0xFF000000);

  // static const Color myTertiaryColorDark = Color(0xFF005994); //
  static const Color myTertiaryColorDark = drColorDeselectedDark;
  static const Color myOnTertiaryColorDark = Color(0xFF000000);

  static const Color mySurfaceColorDark = Color(0xff000000);
  static const Color myOnSurfaceColorDark = Color(0xffffffff);
  static const Color myErrorColorDark = drColorNegativeDark;
  static const Color myOnErrorColorDark = Color(0xff000000);

  static const Color myPrimaryContainerColorDark = Color(0xFF393d8f);
  static const Color myOnPrimaryContainerColorDark = Color(0xFFe1e0ff);
  static const Color mySecondaryContainerColorDark = Color(0xFF00497a);
  static const Color myOnSecondaryContainerColorDark = Color(0xFFd0e4ff);
  static const Color myTertiaryContainerColorDark = Color(0xFF00497a);
  static const Color myOnTertiaryContainerColorDark = Color(0xFFd0e4ff);
  static const Color myErrorContainerColorDark = Color(0xFF93000a);
  static const Color myOnErrorContainerColorDark = Color(0xFFffdad6);
}
