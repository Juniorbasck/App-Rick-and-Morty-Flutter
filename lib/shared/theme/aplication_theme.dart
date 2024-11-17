import 'package:flutter/material.dart';
import 'package:ricka_and_morty/shared/theme/data/app_theme.dart';
import 'package:ricka_and_morty/shared/theme/data/app_theme_model.dart';

class AplicationTheme {
  static final themes = {
    AppTheme.light: AppThemeModel(
      theme: AppTheme.light,
      data: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        cardTheme: const CardTheme(
          elevation: 4.0,
        ),
      ),
    ),
    AppTheme.dark: AppThemeModel(
      theme: AppTheme.dark,
      data: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
    ),
  };
}
