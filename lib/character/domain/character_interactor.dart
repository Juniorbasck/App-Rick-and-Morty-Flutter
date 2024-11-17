import 'package:injectable/injectable.dart';
import 'package:ricka_and_morty/character/service/character_repository.dart';
import 'package:ricka_and_morty/character/service/character_response.dart';

abstract class CharacterInteractor {
  Future<CharacterApiResponse> fetchCharacter(int page);
}

@Injectable(as: CharacterInteractor)
class CharacterInteractorImpl implements CharacterInteractor {
  const CharacterInteractorImpl(this._repository);

  final CharacterRepository _repository;

  @override
  Future<CharacterApiResponse> fetchCharacter(int page) =>
      _repository.getCharacters(page);
}
