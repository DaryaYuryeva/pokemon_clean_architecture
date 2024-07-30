import '../../../../core/connection/network_service.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/pokemons_repository.dart';
import '../data_sources/local/pokemons_local_data_source.dart';
import '../data_sources/remote/pokemons_remote_data_source.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final PokemonsRemoteDataSource remoteDataSource;
  final PokemonsLocalDataSource localDataSource;

  final NetworkService networkService;

  PokemonsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkService,
  });

  @override
  Future<List<Pokemon>> getPokemons({required int offset}) async {
    try {
      if (await networkService.isConnected) {
        final remoteModels = await remoteDataSource.getPokemons(offset: offset);
        await localDataSource.savePokemons(remoteModels);
        return remoteModels.map((e) => e.toEntity).toList();
      } else {
        final localModels = await localDataSource.getPokemons(offset: offset);
        return localModels.map((e) => e.toEntity).toList();
      }
    } catch (e) {
      throw ServerFailure(errorMessage: e.toString());
    }
  }
}
