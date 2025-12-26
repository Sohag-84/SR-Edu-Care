import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sr_edu_care/core/theme/app_colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: primaryColor,
    inputDecorationTheme: inputDecorationTheme,
  );

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: inputFieldColor,

    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: inputBorderColor),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: primaryColor),
    ),
  );
}
