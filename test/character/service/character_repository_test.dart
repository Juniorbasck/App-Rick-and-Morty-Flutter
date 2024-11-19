import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ricka_and_morty/character/service/character_repository.dart';
import 'package:ricka_and_morty/character/service/character_response.dart';
import 'package:ricka_and_morty/character/service/character_service.dart';

void main() {
  group('character repository tests', () {
    late CharacterService service;
    late CharacterRepository repository;

    setUp(() {
      service = CharacterServiceMock();
      repository = CharacterRepositoryImpl(service);
    });

    test(
        'GIVEN a service'
        'WHEN resquest api data at first page'
        'THEN get api response', () async {
      final mock = CharacterApiResponseMoc();
      when(() => service.getCharacters()).thenAnswer((_) async => mock);

      expect(await repository.getCharacters(1), mock);
    });
  });
}

class CharacterServiceMock extends Mock implements CharacterService {}

class CharacterApiResponseMoc extends Mock implements CharacterApiResponse {}
