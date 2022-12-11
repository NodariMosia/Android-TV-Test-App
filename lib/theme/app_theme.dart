import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      applyElevationOverlayColor: true,
      colorScheme: const ColorScheme.dark(
        primary: Colors.white,
        secondary: Colors.grey,
      ),
      brightness: Brightness.dark,
      canvasColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
    );
  }
}
