import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:ricka_and_morty/character/domain/character_interactor.dart';
import 'package:ricka_and_morty/character/service/character_response.dart';
import 'package:ricka_and_morty/shared/event_transformation.dart';

part 'character_event.dart';
part 'character_state.dart';

@injectable
class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc(this._interactor) : super(const CharacterState()) {
    on<CharacterRequestEvent>(
      _onCharacterRequestEvent,
      transformer: throttleDroppable(
        const Duration(milliseconds: 100),
      ),
    );
  }

  final CharacterInteractor _interactor;

  Future<void> _onCharacterRequestEvent(
      CharacterRequestEvent event, Emitter<CharacterState> emit) async {
    if (state.hasReachedMax) {
      return;
    }

    emit(state.copyWith(result: ResultState.loading));

    try {
      final response = await _interactor.fetchCharacter(state.page);

      emit(
        state.copyWith(
          page: state.page + 1,
          characters: List.of(state.characters)..addAll(response.results),
          hasReachedMax: state.page >= (response.info.pages ?? 1),
        ),
      );
    } catch (_) {
      emit(state.copyWith(result: ResultState.error));
    }
  }
}
