import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_clean_architecture/core/constants.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../models/pokemon_details_model.dart';

abstract class PokemonDetailsRemoteDataSource {
  Future<PokemonDetailsModel> getPokemonDetails({required int pokemonId});
}

class PokemonDetailsRemoteDataSourceImpl
    implements PokemonDetailsRemoteDataSource {
  @override
  Future<PokemonDetailsModel> getPokemonDetails(
      {required int pokemonId}) async {
    final url = Uri.parse('${Constants.baseUrl}/$pokemonId');

    try {
      final response = await http.get(url);

      switch (response.statusCode) {
        case 200:
          return PokemonDetailsModel.fromJson(
              jsonDecode(response.body) as Map<String, dynamic>);
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
