import 'package:pokedex_snapfi/main.dart';

abstract class IGetPokemonData {
  Future<PokemonEntity> call(
    String textSearch,
  );
}
