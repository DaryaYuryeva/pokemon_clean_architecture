import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/constants.dart';
import '../../domain/entities/pokemon_details.dart';

part 'pokemon_details_model.g.dart';

@HiveType(typeId: 1)
final class PokemonDetailsModel extends Equatable {
  const PokemonDetailsModel({
    required this.id,
    required this.name,
    required this.image,
    required this.types,
    required this.weight,
    required this.height,
  });

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final List<String> types;

  @HiveField(4)
  final int weight;

  @HiveField(5)
  final int height;

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) =>
      PokemonDetailsModel(
        id: json[Constants.pokemonId],
        name: json[Constants.pokemonName],
        image: json[Constants.pokemonSprites]
            [Constants.pokemonSpritesFrontDefault],
        types: List.from(json[Constants.pokemonTypes])
            .map((e) =>
                e[Constants.pokemonType][Constants.pokemonTypeName] as String)
            .toList(),
        weight: json[Constants.pokemonWeight],
        height: json[Constants.pokemonHeight],
      );

  PokemonDetails get toEntity => PokemonDetails(
        id: id,
        name: name,
        image: image,
        types: types,
        weight: weight,
        height: height,
      );

  // PokemonDetailsModel.fromJson(Map<String, dynamic> json)
  //     : id = json[Constants.pokemonId] as int,
  //       name = json[Constants.pokemonName] as String,
  //       image = json[Constants.pokemonSprites]
  //           [Constants.pokemonSpritesFrontDefault] as String,
  //       types = List.from(json[Constants.pokemonTypes])
  //           .map((e) =>
  //               e[Constants.pokemonType][Constants.pokemonTypeName] as String)
  //           .toList(),
  //       weight = json[Constants.pokemonWeight] as int,
  //       height = json[Constants.pokemonHeight] as int;

  @override
  List<Object?> get props => [id, name, image, types, weight, height];
}
