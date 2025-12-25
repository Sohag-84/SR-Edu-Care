import 'package:flutter/material.dart';
import 'package:udemy_clone/core/theme/app_colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: primaryColor,
  );
}
