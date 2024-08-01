import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common_widgets/image_widget.dart';
import '../../../../core/common_widgets/loader_widget.dart';
import '../bloc/pokemon_details_bloc.dart';

class PokemonDetailsWidget extends StatefulWidget {
  const PokemonDetailsWidget({super.key});

  @override
  State<PokemonDetailsWidget> createState() => _PokemonDetailsWidgetState();
}

class _PokemonDetailsWidgetState extends State<PokemonDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
        builder: (context, state) {
      final data = state.pokemonDetails;

      switch (state.status) {
        case PokemonDetailsStatus.initial || PokemonDetailsStatus.loading:
          return const Center(child: LoaderWidget());
        case PokemonDetailsStatus.success:
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Text(
                      '#${data.id} ${data.name.toUpperCase()}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  ImageWidget(imageUrl: data.image),
                  ListTile(
                    title: const Text('Types'),
                    subtitle: Text(data.types.join(', ')),
                  ),
                  ListTile(
                    title: const Text('Weight'),
                    subtitle: Text('${data.weight} kg'),
                  ),
                  ListTile(
                    title: const Text('Height'),
                    subtitle: Text('${data.height} cm'),
                  ),
                ],
              ),
            ),
          );
        case PokemonDetailsStatus.failure:
          return const Center(
              child: Text('Error, check your internet connection...'));
      }
    });
  }
}
