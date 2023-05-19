import 'package:pokedex_snapfi/main.dart';

class GetPokemonRepository implements IGetPokemonRepository {
  GetPokemonRepository(this.data);

  final IGetPokemonData data;

  @override
  Future<Result<GetPokemonError, PokemonEntity>> call(
    String? namePokemon,
    String? numberPokemon,
    FilterTypeEntity filterTypeEntity,
  ) async {
    try {
      if (filterTypeEntity == FilterTypeEntity.name) {
        if (namePokemon == null || namePokemon.isEmpty) {
          throw GetPokemonError("O nome não pode ser Vazio");
        }
      } else {
        if (numberPokemon == null || numberPokemon.isEmpty) {
          throw GetPokemonError("O numero do não pode ser Vazio");
        }
      }

      final textFilter = filterTypeEntity == FilterTypeEntity.name
          ? namePokemon!.toLowerCase()
          : numberPokemon!.toLowerCase();

      final pokemon = await data(textFilter);

      return Result.success(pokemon);
    } on GetPokemonError catch (e) {
      return Result.failure(e);
    } catch (e) {
      if (e.toString().contains("Not Found")) {
        return Result.failure(GetPokemonError("Pokemon Não Encontrado"));
      }
      return Result.failure(
        GetPokemonError("Algo Inesperado Aconteceu"),
      );
    }
  }
}
