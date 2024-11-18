import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricka_and_morty/datails/presentation/bloc/character_details_bloc.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key, required this.characterId});

  final String characterId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterDetailsBloc, CharacterDetailsState>(
      builder: (context, state) {
        return Stack(
          children: [
            if (state is CharacterDetailsLoadingState) ...{
              const Text('Loading...')
            } else if (state is CharacterDetailsResultState) ...{
              const Text('Resultado')
            } else ...{
              const Text('Error')
            }
          ],
        );
      },
    );
  }
}
