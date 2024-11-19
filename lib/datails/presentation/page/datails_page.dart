import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ricka_and_morty/datails/presentation/bloc/character_details_bloc.dart';
import 'package:ricka_and_morty/datails/presentation/widget/details_widget.dart';

class DatailsPage extends StatelessWidget {
  const DatailsPage({super.key, required this.characterId});

  final String characterId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<CharacterDetailsBloc>()
        ..add(CharacterDetailsRequestEvent(characterId)),
      child: Scaffold(
        appBar: AppBar(),
        body: DetailsWidget(
          characterId: characterId,
        ),
      ),
    );
  }
}
