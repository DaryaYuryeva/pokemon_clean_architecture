part of 'pokemon_bloc.dart';

enum PokemonStatus { initial, loading, success, failure }

final class PokemonState extends Equatable {
  const PokemonState({
    this.status = PokemonStatus.initial,
    this.pokemons = const <Pokemon>[],
    this.hasReachedEnd = false,
    this.currentOffset = 0,
  });

  final PokemonStatus status;
  final List<Pokemon> pokemons;
  final bool hasReachedEnd;
  final int currentOffset;

  PokemonState copyWith({
    PokemonStatus? status,
    List<Pokemon>? pokemons,
    bool? hasReachedEnd,
    int? currentOffset,
  }) {
    return PokemonState(
      status: status ?? this.status,
      pokemons: pokemons ?? this.pokemons,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      currentOffset: currentOffset ?? this.currentOffset,
    );
  }

  @override
  List<Object> get props => [
        status,
        pokemons,
        hasReachedEnd,
        currentOffset,
      ];
}
