import 'package:flutter/material.dart';

import '../widgets/pokemon_list.dart';

class PokemonsPage extends StatelessWidget {
  const PokemonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon List'),
        ),
        body: const PokemonList(),
      ),
    );
  }
}
