import 'package:flutter/material.dart';
import 'package:ricka_and_morty/shared/theme/data/app_theme.dart';

class AppThemeModel {
  AppThemeModel({
    required this.theme,
    required this.data,
  });

  final AppTheme theme;
  final ThemeData data;
}