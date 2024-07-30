part of 'pokemon_details_bloc.dart';

enum PokemonDetailsStatus { initial, loading, success, failure }

final class PokemonDetailsState extends Equatable {
  const PokemonDetailsState({
    this.status = PokemonDetailsStatus.initial,
    this.pokemonDetails = PokemonDetails.empty,
  });

  final PokemonDetailsStatus status;
  final PokemonDetails pokemonDetails;

  PokemonDetailsState copyWith({
    PokemonDetailsStatus? status,
    PokemonDetails? pokemonDetails,
  }) {
    return PokemonDetailsState(
      status: status ?? this.status,
      pokemonDetails: pokemonDetails ?? this.pokemonDetails,
    );
  }

  @override
  List<Object> get props => [status, pokemonDetails];
}
