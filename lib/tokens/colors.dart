import 'package:flutter/widgets.dart';
class AppColor {
  AppColor._();
  static const Color dr_primary_light = Color(0xFF005A94);
  static const Color dr_primary_dark = Color(0xFF009AFF);
  static const Color dr_secondary_light = Color(0xFF009AFF);
  static const Color dr_secondary_dark = Color(0xFF005994);
  static const Color dr_positive_light = Color(0xFF006600);
  static const Color dr_positive_dark = Color(0xFF00C300);
  static const Color dr_negative_light = Color(0xFFAC0000);
  static const Color dr_negative_dark = Color(0xFFFF614D);
  static const Color dr_deselected_light = Color(0xFF575757);
  static const Color dr_deselected_dark = Color(0xFF969696);

  static const Color aw_mid_blue = Color(0xFF176CED);
  static const Color aw_dark_blue = Color(0xFF0000BC);
  static const Color aw_dark_grey = Color(0xFF5B6670);
  static const Color aw_mid_grey = Color(0xFF8997A8);
  static const Gradient aw_light_gradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xff2DB5EF),
      Color(0xff1756ED),
    ],
  );
  static const Gradient aw_dark_gradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xff0500EF),
      Color(0xff000080),
    ],
  );
  static const Gradient aw_silver_gradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xffC7C7C7),
      Color(0xff5B6671),
    ],
  );
  static const Color aw_diving_solid = Color(0xFF363A8B);
  static const Gradient aw_diving_gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xff1120BC),
      Color(0xff3030A3),
    ],
  );
}