import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../../core/constants.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/use_cases/get_pokemons.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc({required GetPokemons getPokemons})
      : _getPokemons = getPokemons,
        super(const PokemonState()) {
    on<FetchNextEvent>(
      _onFetchNext,
      transformer: throttleDroppable(const Duration(milliseconds: 100)),
    );
  }

  final GetPokemons _getPokemons;

  Future<void> _onFetchNext(event, Emitter<PokemonState> emit) async {
    if (state.hasReachedEnd) return;

    emit(state.copyWith(status: PokemonStatus.loading));

    try {
      final list = await _getPokemons.execute(offset: state.currentOffset);

      emit(
        state.copyWith(
          status: PokemonStatus.success,
          pokemons: List.of(state.pokemons)
            ..addAll(list),
          hasReachedEnd: list.isEmpty,
          currentOffset:
          state.currentOffset + Constants.pokemonListPaginationLimit,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: PokemonStatus.failure));
    }
  }
}
