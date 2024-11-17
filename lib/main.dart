import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:ricka_and_morty/home/page/home_page.dart';
import 'package:ricka_and_morty/injection.dart';
import 'package:ricka_and_morty/shared/theme/aplication_theme.dart';
import 'package:ricka_and_morty/shared/theme/data/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(
    DevicePreview(
      builder: (_) {
        return const RickAndMortyApp();
      },
    ),
  );
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AplicationTheme.themes[AppTheme.dark]?.data,
      home: const HomePage(),
    );
  }
}
