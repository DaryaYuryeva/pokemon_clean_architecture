import 'package:hive_flutter/hive_flutter.dart';

import '../../features/pokemon/data/models/pokemon_model.dart';
import '../../features/pokemon_details/data/models/pokemon_details_model.dart';
import '../constants.dart';

late Box<PokemonModel> pokemonsBox;
late Box<PokemonDetailsModel> pokemonDetailsBox;

class HiveService {
  static initHive() async {
    await Hive.initFlutter();
    Hive
      ..registerAdapter(PokemonModelAdapter())
      ..registerAdapter(PokemonDetailsModelAdapter());

    pokemonsBox = await Hive.openBox<PokemonModel>(Constants.pokemonsBoxKey);
    pokemonDetailsBox =
        await Hive.openBox<PokemonDetailsModel>(Constants.pokemonDetailsBoxKey);
  }
}
