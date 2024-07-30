part of 'pokemon_bloc.dart';

sealed class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object?> get props => [];
}

final class FetchNextEvent extends PokemonEvent {
  const FetchNextEvent();
}
