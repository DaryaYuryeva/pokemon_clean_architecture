import '../entities/pokemon_details.dart';

abstract class PokemonDetailsRepository {
  Future<PokemonDetails> getPokemonDetails({required int pokemonId});
}
