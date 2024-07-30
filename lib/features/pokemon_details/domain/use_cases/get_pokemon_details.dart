import '../entities/pokemon_details.dart';
import '../repositories/pokemon_details_repository.dart';

class GetPokemonDetails {
  final PokemonDetailsRepository repository;

  GetPokemonDetails({required this.repository});

  Future<PokemonDetails> execute({required int pokemonId}) async {
    return await repository.getPokemonDetails(pokemonId: pokemonId);
  }
}
