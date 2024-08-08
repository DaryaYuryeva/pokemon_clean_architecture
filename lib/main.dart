import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/get_it/injection_container.dart' as di;
import 'core/hive/hive_service.dart';
import 'core/themes.dart';
import 'features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'features/pokemon/presentation/pages/pokemons_page.dart';
import 'features/pokemon_details/presentation/bloc/pokemon_details_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.initHive();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonBloc>(
          create: (context) =>
              di.sl<PokemonBloc>()..add(const FetchNextEvent()),
        ),
        BlocProvider<PokemonDetailsBloc>(
          create: (context) =>
              di.sl<PokemonDetailsBloc>()..add(const GetDetailsEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Pokemon's List",
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: ThemeMode.system,
        home: const PokemonsPage(),
      ),
    );
  }
}
