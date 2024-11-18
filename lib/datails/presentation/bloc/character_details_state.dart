part of 'character_details_bloc.dart';

sealed class CharacterDetailsState extends Equatable {
  const CharacterDetailsState();

  @override
  List<Object> get props => [];
}

final class CharacterDetailsInitialState extends CharacterDetailsState {}

final class CharacterDetailsLoadingState extends CharacterDetailsState {}

final class CharacterDetailsErrorState extends CharacterDetailsState {}

final class CharacterDetailsResultState extends CharacterDetailsState {
  const CharacterDetailsResultState(this.response);

  final CharacterDetailsResponse response;

  @override
  List<Object> get props => [response];
}
