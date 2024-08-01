import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pokemon_bloc.dart';
import '../../../../core/common_widgets/loader_widget.dart';
import 'pokemon_list_item.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        switch (state.status) {
          case PokemonStatus.initial:
            return const Center(child: LoaderWidget());
          case PokemonStatus.loading:
          case PokemonStatus.success:
            // if (state.pokemons.isEmpty) {
            //   return const Center(child: Text('No Pokemons'));
            // }

            return Stack(
              children: [
                ListView.builder(
                  key: const ValueKey('character_page_list_key'),
                  controller: _scrollController,
                  itemCount: state.hasReachedEnd
                      ? state.pokemons.length
                      : state.pokemons.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return index >= state.pokemons.length
                        ? const LoaderWidget()
                        : PokemonListItem(pokemon: state.pokemons[index]);
                  },
                ),
                Positioned(
                  right: 30,
                  bottom: 30,
                  child: FloatingActionButton(
                    onPressed: _scrollToTop,
                    tooltip: 'Scroll to Top',
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.arrow_upward,
                      size: 20,
                    ),
                  ),
                ),
              ],
            );

          case PokemonStatus.failure:
            return const Center(
                child: Text('Error, check your internet connection...'));
        }
      },
    );
  }

  void _onScroll() {
    if (_isBottom) context.read<PokemonBloc>().add(const FetchNextEvent());
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(microseconds: 10),
      curve: Curves.easeInOut,
    );
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
