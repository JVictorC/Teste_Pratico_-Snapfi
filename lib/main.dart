import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_snapfi/src/core/core.dart';
import 'package:pokedex_snapfi/src/modules/home/home.dart';

export 'src/core/core.dart';
export 'src/modules/home/home.dart';
export 'src/modules/details_pokemon/details_pokemon.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initAllDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => I.get<HomePageCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'PokeDex Inicie',
        theme: pokedexTheme,
        routes: pokedexRoutes,
        initialRoute: PokedexRoutes.homePage,
      ),
    ),
  );
}
