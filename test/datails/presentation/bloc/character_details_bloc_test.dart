import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ricka_and_morty/character/presentation/bloc/character_bloc.dart';
import 'package:ricka_and_morty/datails/data/characer_details_repository.dart';
import 'package:ricka_and_morty/datails/data/service/character_details_response.dart';
import 'package:ricka_and_morty/datails/presentation/bloc/character_details_bloc.dart';

void main() {
  group('character details bloc succces flow', () {
    late CharacterDetailsRepository repository;
    late CharacterDetailsBloc bloc;
    late CharacterDetailsResponse response;

    setUp(() {
      repository = CharacterDetailsRepositoryMock();
      response = CharacterDetailsResponseMock();
      bloc = CharacterDetailsBloc(repository);

      when(() => repository.getCharacterDetails('1'))
          .thenAnswer((_) async => response);
    });

    blocTest(
      'should emit sucess result ',
      build: () => bloc,
      tearDown: () => bloc.close(),
      act: (bloc) => bloc.add(const CharacterDetailsRequestEvent('1')),
      expect: () => [
        CharacterDetailsLoadingState(),
        CharacterDetailsResultState(
          response,
        )
      ],
      verify: (_) async =>
          {verify(() => repository.getCharacterDetails('1')).called(1)},
    );
  });

  group('character details bloc error flow', () {
    late CharacterDetailsRepository repository;
    late CharacterDetailsBloc bloc;

    setUp(() {
      repository = CharacterDetailsRepositoryMock();
      bloc = CharacterDetailsBloc(repository);

      when(() => repository.getCharacterDetails('1'))
          .thenThrow((_) async => Exception('Ops something wrong happened'));
    });

    blocTest(
      'should emit error result ',
      build: () => bloc,
      tearDown: () => bloc.close(),
      act: (bloc) => bloc.add(const CharacterDetailsRequestEvent('1')),
      expect: () =>
          [CharacterDetailsLoadingState(), CharacterDetailsErrorState()],
      verify: (_) async =>
          {verify(() => repository.getCharacterDetails('1')).called(1)},
    );
  });
}

class CharacterDetailsRepositoryMock extends Mock
    implements CharacterDetailsRepository {}

class CharacterDetailsResponseMock extends Mock
    implements CharacterDetailsResponse {}
