import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    AppTheme.halloween: AppThemeModel(
      theme: AppTheme.halloween,
      data: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.orange[100],
        textTheme: GoogleFonts.emilysCandyTextTheme(),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),
      ),
    ),
    AppTheme.piano: AppThemeModel(
      theme: AppTheme.piano,
      data: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.aclonicaTextTheme(),
        cardTheme: const CardTheme(
          elevation: 1.0,
          color: Colors.white,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(
            0xFF000000,
            <int, Color>{
              50: Color(0xFF000000),
              100: Color(0xFF000000),
              200: Color(0xFF000000),
              300: Color(0xFF000000),
              400: Color(0xFF000000),
              500: Color(0xFF000000),
              600: Color(0xFF000000),
              700: Color(0xFF000000),
              800: Color(0xFF000000),
              900: Color(0xFF000000),
            },
          ),
        ),
      ),
    ),
  };
}
