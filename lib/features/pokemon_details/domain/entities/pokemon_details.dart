import 'package:equatable/equatable.dart';

final class PokemonDetails extends Equatable {
  const PokemonDetails({
    required this.id,
    required this.name,
    required this.image,
    required this.types,
    required this.weight,
    required this.height,
  });

  final int id;
  final String name;
  final String image;
  final List<String> types;
  final int weight;
  final int height;

  static const empty = PokemonDetails(
      id: 0, name: '', image: '', types: [], weight: 0, height: 0);

  @override
  List<Object?> get props => [id, name, image, types, weight, height];
}
