import 'package:pokedex_snapfi/main.dart';

abstract class IGetPokemonRepository {
  Future<Result<GetPokemonError, PokemonEntity>> call(
    String? namePokemon,
    String? numberPokemon,
    FilterTypeEntity filterTypeEntity,
  );
}
