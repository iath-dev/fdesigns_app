import 'package:fdesigns_app/themes/color_schemes.g.dart';
import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  static final ThemeData _theme = ThemeData.light().copyWith(
      colorScheme: lightColorScheme,
      appBarTheme: const AppBarTheme(elevation: 0));

  static final ThemeData _darkTheme = ThemeData.dark().copyWith(
    colorScheme: darkColorScheme,
  );

  bool _dark = false;

  set dark(bool value) {
    _dark = value;
    notifyListeners();
  }

  bool get dark => _dark;

  ThemeData get theme => _theme;
  ThemeData get darkTheme => _darkTheme;
}
