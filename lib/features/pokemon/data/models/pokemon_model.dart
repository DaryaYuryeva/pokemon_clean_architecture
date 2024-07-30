import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/constants.dart';
import '../../domain/entities/pokemon.dart';

part 'pokemon_model.g.dart';

@HiveType(typeId: 0)
final class PokemonModel extends Equatable {
  const PokemonModel({
    required this.name,
    required this.url,
  });

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String url;

  int get id {
    final idString = url.replaceAll(Constants.baseUrl, '').replaceAll('/', '');
    return int.parse(idString);
  }

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        name: json[Constants.pokemonName],
        url: json[Constants.pokemonUrl],
      );

  Pokemon get toEntity => Pokemon(name: name, url: url);

  @override
  List<Object?> get props => [name, url];
}
