
import 'package:pokedex_snapfi/main.dart';

class PokedexRoutes {
  static const homePage = "HomePage";
  static const detailsPokemon = "DetailsPokemon";

}

final pokedexRoutes = {
  PokedexRoutes.homePage: (context) => const HomePage(),
  PokedexRoutes.detailsPokemon: (context) => const DetailsPokemonPage(),
};
