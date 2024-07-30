import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/pokemon_details.dart';
import '../../domain/use_cases/get_pokemon_details.dart';

part 'pokemon_details_event.dart';
part 'pokemon_details_state.dart';

class PokemonDetailsBloc
    extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  PokemonDetailsBloc({required GetPokemonDetails getPokemonDetails})
      : _getPokemonDetails = getPokemonDetails,
        super(const PokemonDetailsState()) {
    on<GetDetailsEvent>(
      _onFetchEvent,
    );
  }

  final GetPokemonDetails _getPokemonDetails;

  Future<void> _onFetchEvent(event, Emitter<PokemonDetailsState> emit) async {
    emit(state.copyWith(status: PokemonDetailsStatus.loading));

    try {
      final pokemonDetails = await _getPokemonDetails.execute(pokemonId: event.pokemonId);

      emit(
        state.copyWith(
          status: PokemonDetailsStatus.success,
          pokemonDetails: pokemonDetails,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: PokemonDetailsStatus.failure));
    }
  }
}
