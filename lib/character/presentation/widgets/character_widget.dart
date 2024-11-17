import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricka_and_morty/character/presentation/bloc/character_bloc.dart';
import 'package:ricka_and_morty/character/presentation/widgets/character_card_widget.dart';
import 'package:ricka_and_morty/shared/widgets/default_loading_widget.dart';
import 'package:ricka_and_morty/shared/widgets/default_try_again_widget.dart';

class CharacterWidget extends StatefulWidget {
  const CharacterWidget({super.key});

  @override
  State<CharacterWidget> createState() => _CharacterWidgetState();
}

class _CharacterWidgetState extends State<CharacterWidget> {
  final _srollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _srollController.addListener(_onScrollListener);
  }

  @override
  void dispose() {
    _srollController
      ..removeListener(_onScrollListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        return Stack(
          children: [
            if (state.result == ResultState.initial ||
                state.result == ResultState.loading && state.isFirstPage) ...{
              const Center(
                child: DefaultLoadingWidget(),
              )
            } else if (state.result == ResultState.error &&
                state.isFirstPage) ...{
              Center(
                child: DefaultTryAgainWidget(
                  onPressed: _requestCharacter,
                ),
              )
            } else ...{
              ListView.builder(
                shrinkWrap: true,
                controller: _srollController,
                itemBuilder: (context, index) {
                  if (index < state.characters.length) {
                    return CharacterCardWidget(
                      response: state.characters[index],
                      onTap: () => [],
                    );
                  } else if (state.result == ResultState.error) {
                    return DefaultTryAgainWidget(
                      onPressed: _requestCharacter,
                    );
                  } else {
                    return const DefaultLoadingWidget();
                  }
                },
                itemCount: state.hasReachedMax
                    ? state.characters.length
                    : state.characters.length + 1,
              )
            }
          ],
        );
      },
    );
  }

  void _requestCharacter() {
    context.read<CharacterBloc>().add(CharacterRequestEvent());
  }

  void _onScrollListener() {
    if (_isBottomReached &&
        context.read<CharacterBloc>().state.result != ResultState.error) {
      _requestCharacter();
    }
  }

  bool get _isBottomReached {
    if (!_srollController.hasClients) {
      return false;
    }

    return _srollController.offset >=
        (_srollController.position.maxScrollExtent * 0.9);
  }
}
