import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:ricka_and_morty/datails/presentation/page/datails_page.dart';
import 'package:ricka_and_morty/home/page/home_page.dart';
import 'package:ricka_and_morty/injection.dart';
import 'package:ricka_and_morty/shared/theme/aplication_theme.dart';
import 'package:ricka_and_morty/shared/theme/data/cubit/theme_cubit.dart';

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
    return BlocProvider<ThemeCubit>(
      create: (_) => GetIt.I.get<ThemeCubit>(),
      child: const _App(),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
      routes: <RouteBase>[
        GoRoute(
          name: 'details',
          path: 'details/:id',
          builder: (context, state) => DatailsPage(
            characterId: state.pathParameters['id'] ?? '1',
          ),
        )
      ],
    )
  ],
);

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, String>(
      builder: (_, state) => MaterialApp.router(
        routerConfig: _router,
        theme: AplicationTheme.byName(state)?.data,
      ),
    );
  }
}
