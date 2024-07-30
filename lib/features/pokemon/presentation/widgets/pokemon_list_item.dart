import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../pokemon_details/presentation/bloc/pokemon_details_bloc.dart';
import '../../../pokemon_details/presentation/pages/pokemon_details_page.dart';
import '../../domain/entities/pokemon.dart';

class PokemonListItem extends StatelessWidget {
  const PokemonListItem({required this.pokemon, super.key});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Text(
        '${pokemon.id}',
        style: textTheme.bodySmall,
      ),
      title: Text(pokemon.name),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            context
                .read<PokemonDetailsBloc>()
                .add(GetDetailsEvent(pokemonId: pokemon.id));
            return const PokemonDetailsPage();
          }),
        );
      },
    );
  }
}
