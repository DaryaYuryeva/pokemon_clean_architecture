import 'dart:math';

import '../../../../../core/constants.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/hive/hive_service.dart';
import '../../models/pokemon_model.dart';

abstract class PokemonsLocalDataSource {
  savePokemons(List<PokemonModel> pokemons);
  Future<List<PokemonModel>> getPokemons({required int offset});
}

class PokemonsLocalDataSourceImpl implements PokemonsLocalDataSource {
  @override
  savePokemons(List<PokemonModel> pokemons) async {
    for (var pokemon in pokemons) {
      try {
        pokemonsBox.put(pokemon.id, pokemon);
      } on CacheException catch (e){
        throw CacheException(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<List<PokemonModel>> getPokemons({required int offset}) async {
    final count = pokemonsBox.length;
    final lastIndex = count - 1;
    final offsetEnd = offset + Constants.pokemonListPaginationLimit;
    final beginIndex = min(offset, lastIndex);
    final endIndex = min(offsetEnd, lastIndex);
    final result = <PokemonModel>[];

    for (var i = beginIndex; i < endIndex; i++) {
      try {
        final pokemon = pokemonsBox.getAt(i);
        if (pokemon != null) {
          result.add(pokemon);
        }
      } on CacheException catch (e){
        throw CacheException(errorMessage: e.toString());
      }
    }

    return result;
  }
}
