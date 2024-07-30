import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../core/constants.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../models/pokemon_model.dart';

abstract class PokemonsRemoteDataSource {
  Future<List<PokemonModel>> getPokemons({required int offset});
}

class PokemonsRemoteDataSourceImpl implements PokemonsRemoteDataSource {
  @override
  Future<List<PokemonModel>> getPokemons({required int offset}) async {
    final url = Uri.parse(
        '${Constants.baseUrl}?offset=$offset&limit=${Constants.pokemonListPaginationLimit}');

    try {
      final response = await http.get(url);

      switch (response.statusCode) {
        case 200:
          return (json.decode(response.body)['results'] as List<dynamic>)
              .map((e) => PokemonModel.fromJson(e))
              .toList();
        case 400:
          throw const ServerException(errorMessage: 'Bad Request');
        case 401:
          throw const ServerException(errorMessage: 'Unauthorized');
        case 500:
          throw const ServerException(errorMessage: 'Internal Server Error');
        default:
          throw const ServerException(errorMessage: 'Unknown Error');
      }
    } catch (e) {
      if (e is ServerException) rethrow;
      throw e.toString();
    }
  }
}
