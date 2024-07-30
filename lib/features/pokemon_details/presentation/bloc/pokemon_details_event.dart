part of 'pokemon_details_bloc.dart';

sealed class PokemonDetailsEvent extends Equatable {
  const PokemonDetailsEvent();

  @override
  List<Object?> get props => [];
}

final class GetDetailsEvent extends PokemonDetailsEvent {
  final int? pokemonId;

  const GetDetailsEvent({this.pokemonId});
}
