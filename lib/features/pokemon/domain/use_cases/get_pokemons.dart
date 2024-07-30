import '../entities/pokemon.dart';
import '../repositories/pokemons_repository.dart';

class GetPokemons {
  final PokemonsRepository repository;

  GetPokemons({required this.repository});

  Future<List<Pokemon>> execute({required offset}) async {
    return await repository.getPokemons(offset: offset);
  }
}
