import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricka_and_morty/datails/presentation/bloc/character_details_bloc.dart';
import 'package:ricka_and_morty/datails/presentation/widget/character_details_location_widget.dart';
import 'package:ricka_and_morty/shared/dataStructure/pair.dart';
import 'package:ricka_and_morty/shared/widgets/default_loading_widget.dart';
import 'package:ricka_and_morty/shared/widgets/default_try_again_widget.dart';

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
              const Center(
                child: DefaultLoadingWidget(),
              )
            } else if (state is CharacterDetailsResultState) ...{
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.network(
                        state.response.image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    ...[
                      Pair('Name', state.response.name),
                      Pair('Name', state.response.status),
                      Pair('Species', state.response.species),
                      Pair('Type', state.response.type),
                    ].map(
                      (pair) => ListTile(
                        title: Text(pair.first),
                        subtitle: Text(pair.second),
                      ),
                    ),
                    if (state.response.locations.isNotEmpty) ...{
                      GridView.count(
                        crossAxisCount: state.response.locations.length,
                        shrinkWrap: true,
                        children: state.response.locations
                            .map(
                              (currentLocation) =>
                                  CharacterDetailsLocationWidget(
                                location: currentLocation,
                              ),
                            )
                            .toList(),
                      )
                    }
                  ],
                ),
              )
            } else ...{
              Center(
                child: DefaultTryAgainWidget(
                  onPressed: () => _requestCharacterDetails(context),
                ),
              )
            }
          ],
        );
      },
    );
  }

  void _requestCharacterDetails(BuildContext context) =>
      context.read<CharacterDetailsBloc>()
        ..add(CharacterDetailsRequestEvent(characterId));
}
