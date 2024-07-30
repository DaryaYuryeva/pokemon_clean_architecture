import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_clean_architecture/core/connection/network_service.dart';

import '../../features/pokemon/data/data_sources/local/pokemons_local_data_source.dart';
import '../../features/pokemon/data/data_sources/remote/pokemons_remote_data_source.dart';
import '../../features/pokemon/data/repositories/pokemons_repository_impl.dart';
import '../../features/pokemon/domain/repositories/pokemons_repository.dart';
import '../../features/pokemon/domain/use_cases/get_pokemons.dart';
import '../../features/pokemon/presentation/bloc/pokemon_bloc.dart';
import '../../features/pokemon_details/data/data_sources/local/pokemon_details_local_data_source.dart';
import '../../features/pokemon_details/data/data_sources/remote/pokemon_details_remote_data_source.dart';
import '../../features/pokemon_details/data/repositories/pokemons_repository_impl.dart';
import '../../features/pokemon_details/domain/repositories/pokemon_details_repository.dart';
import '../../features/pokemon_details/domain/use_cases/get_pokemon_details.dart';
import '../../features/pokemon_details/presentation/bloc/pokemon_details_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Feature - POKEMON:
  // Data
  // DataSources
  sl.registerLazySingleton<PokemonsRemoteDataSource>(
      () => PokemonsRemoteDataSourceImpl());
  sl.registerLazySingleton<PokemonsLocalDataSource>(
      () => PokemonsLocalDataSourceImpl());

  // Repositories
  sl.registerLazySingleton<PokemonsRepository>(() => PokemonsRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkService: sl(),
      ));

  // Domain
  // Usecases
  sl.registerLazySingleton(() => GetPokemons(repository: sl()));

  // Presentation
  // BLoC
  sl.registerFactory(() => PokemonBloc(getPokemons: sl()));

  // Feature - POKEMON details:
  // Data
  // DataSources
  sl.registerLazySingleton<PokemonDetailsRemoteDataSource>(
      () => PokemonDetailsRemoteDataSourceImpl());
  sl.registerLazySingleton<PokemonDetailsLocalDataSource>(
      () => PokemonDetailsLocalDataSourceImpl());

  // Repositories
  sl.registerLazySingleton<PokemonDetailsRepository>(
      () => PokemonDetailsRepositoryImpl(
            remoteDataSource: sl(),
            localDataSource: sl(),
            networkService: sl(),
          ));

  // Domain
  // Usecases
  sl.registerLazySingleton(() => GetPokemonDetails(repository: sl()));

  // Presentation
  // BLoC
  sl.registerFactory(() => PokemonDetailsBloc(getPokemonDetails: sl()));

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => NetworkService());
}
