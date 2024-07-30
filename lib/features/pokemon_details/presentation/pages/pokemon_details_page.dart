import 'package:flutter/material.dart';

import '../widgets/pokemon_details_widget.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: const PokemonDetailsWidget(),
    );
  }
}
