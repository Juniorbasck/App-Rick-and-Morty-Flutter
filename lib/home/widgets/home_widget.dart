import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricka_and_morty/character/presentation/page/character_page.dart';
import 'package:ricka_and_morty/home/presentation/cubit/navigation_cubit.dart';
import 'package:ricka_and_morty/settings/presentation/page/settings_page.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({super.key});

  final _pages = {
    const CharacterPage(): const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Characters',
    ),
    const SettingsPage(): const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'settings',
    ),
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state,
            children: _pages.keys.toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: _pages.values.toList(),
            currentIndex: state,
            onTap: (value) => context.read<NavigationCubit>().onSelected(value),
          ),
        );
      },
    );
  }
}
