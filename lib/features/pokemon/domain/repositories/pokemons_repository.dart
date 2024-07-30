import '../entities/pokemon.dart';

abstract class PokemonsRepository {
  Future<List<Pokemon>> getPokemons({required int offset});
}
