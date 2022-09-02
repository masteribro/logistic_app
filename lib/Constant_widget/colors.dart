import 'package:flutter/material.dart';

class AppColors {
  //Black
  static const Color primary = Color(0XFF0E0E0E);
  static const Color whiteDull = Color(0XFF9FA5C0);
  static const Color white = Colors.white;
  static const Color greenDark = Color(0XFF11211A);
  static const Color primaryBtn = Color(0XFF1FCC79);
  static const Color ash = Color(0XFF3F3F3F);
  static const Color blackLight = Color(0XFF1C1C1C);
  static Color homeAppBar = const Color(0X991C1C1C);
  static Color borderColor = const Color(0XFF3F3F3F);
  static Color cancelbutton = const Color(0XFFFBF9F7);
  static Color successDialog = const Color(0XFF313131);
  static Color postBarColor = const Color(0XFFC4C4C4);
  static const kPrimaryColor = Color(0XFF293462);
  static const kBackgroundColor = Color(0XFFE8F9FD);

}


extension ColorExt  on Color {
  Color disable(bool? status) {
    if(status != null && !status) {
      return this;
    }

    return withOpacity(0.5);
  }
}