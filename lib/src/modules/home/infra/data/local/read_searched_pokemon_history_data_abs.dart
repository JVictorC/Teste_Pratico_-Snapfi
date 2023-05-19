import 'package:pokedex_snapfi/main.dart';

abstract class IReadSearchedPokemonHistoryData {
  Future<List<PokemonEntity>> call();
}