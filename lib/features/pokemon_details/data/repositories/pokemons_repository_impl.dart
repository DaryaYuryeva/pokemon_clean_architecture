import '../../../../core/connection/network_service.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/pokemon_details.dart';
import '../../domain/repositories/pokemon_details_repository.dart';
import '../data_sources/local/pokemon_details_local_data_source.dart';
import '../data_sources/remote/pokemon_details_remote_data_source.dart';

class PokemonDetailsRepositoryImpl implements PokemonDetailsRepository {
  final PokemonDetailsRemoteDataSource remoteDataSource;
  final PokemonDetailsLocalDataSource localDataSource;

  final NetworkService networkService;

  PokemonDetailsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkService,
  });

  @override
  Future<PokemonDetails> getPokemonDetails({required int pokemonId}) async {
    try {
      if (await networkService.isConnected) {
        final remoteModel =
            await remoteDataSource.getPokemonDetails(pokemonId: pokemonId);
        await localDataSource.savePokemonDetails(remoteModel);
        return remoteModel.toEntity;
      } else {
        final localModel =
            await localDataSource.getPokemonDetails(pokemonId: pokemonId);
        return localModel.toEntity;
      }
    } catch (e) {
      throw ServerFailure(errorMessage: e.toString());
    }
  }
}
