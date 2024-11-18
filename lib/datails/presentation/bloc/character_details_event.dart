part of 'character_details_bloc.dart';

sealed class CharacterDetailsEvent extends Equatable {
  const CharacterDetailsEvent();

  @override
  List<Object> get props => [];
}

class CharacterDetailsRequestEvent extends CharacterDetailsEvent {
  const CharacterDetailsRequestEvent(this.characterId);

  final String characterId;

  @override
  List<Object> get props => [characterId];
}
