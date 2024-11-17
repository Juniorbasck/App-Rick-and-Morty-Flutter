import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ricka_and_morty/character/service/character_response.dart';

abstract class CharacterService {
  Future<CharacterApiResponse> getCharacters([int page = 1]);
}

@Injectable(as: CharacterService)
class CharacterServiceImpl implements CharacterService {
  CharacterServiceImpl(this._client);

  final Dio _client;

  @override
  Future<CharacterApiResponse> getCharacters([int page = 1]) async {
    final response = await _client.get(
      'character',
      queryParameters: {
        'page': '$page',
      },
    );

    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (response.statusCode == 200) {
      return CharacterApiResponse.fromJson(response.data);
    }
    throw const HttpException('Failed to load characters');
  }
}
