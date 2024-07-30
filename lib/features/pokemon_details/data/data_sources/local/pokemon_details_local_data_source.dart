import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/hive/hive_service.dart';
import '../../models/pokemon_details_model.dart';

abstract class PokemonDetailsLocalDataSource {
  savePokemonDetails(PokemonDetailsModel pokemonDetails);
  Future<PokemonDetailsModel> getPokemonDetails({required int pokemonId});
}

class PokemonDetailsLocalDataSourceImpl
    implements PokemonDetailsLocalDataSource {
  @override
  savePokemonDetails(PokemonDetailsModel pokemonDetails) async {
    try {
      pokemonDetailsBox.put(pokemonDetails.id, pokemonDetails);
    } on CacheException catch (e){
      throw CacheException(errorMessage: e.toString());
    }
  }

  @override
  Future<PokemonDetailsModel> getPokemonDetails({required int pokemonId}) async {
    final details = pokemonDetailsBox.get(pokemonId);
    return details ??
        (throw CacheException(
            errorMessage: "Don't find pokemon by id - $pokemonId"));
  }
}
