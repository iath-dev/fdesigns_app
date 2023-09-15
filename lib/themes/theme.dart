import 'package:fdesigns_app/themes/color_schemes.g.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData().copyWith(
      colorScheme: lightColorScheme,
      cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(color: lightColorScheme.primary))));
}
