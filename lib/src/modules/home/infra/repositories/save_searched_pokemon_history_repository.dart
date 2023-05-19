import 'package:pokedex_snapfi/main.dart';

class SaveSearchedPokemonHistoryRepository
    implements ISaveSearchedPokemonHistoryRepository {
  final IReadSearchedPokemonHistoryData dataReadPokemon;
  final ISaveSearchedPokemonHistoryData dataSavePokemon;

  SaveSearchedPokemonHistoryRepository(
    this.dataReadPokemon,
    this.dataSavePokemon,
  );

  @override
  Future<Result<SavePokemonError, bool>> call(PokemonEntity pokemon) async {
    try {
      final newPokemon = PokemonModel.fromEntity(pokemon);
      final allPokemonsInHistory = await dataReadPokemon();

      if (allPokemonsInHistory.isEmpty) {
        await dataSavePokemon(
          {
            "data": [
              newPokemon.toJson(),
            ]
          },
        );
        return const Result.success(true);
      }

      allPokemonsInHistory.removeWhere(
        (element) => element.toString().contains(pokemon.name),
      );

      allPokemonsInHistory.add(newPokemon);

      await dataSavePokemon(
        {
          "data": allPokemonsInHistory.map(
              (e) => PokemonModel.fromEntity(e).toJson(),
            ).toList(),
          
        },
      );

      return const Result.success(true);
    } catch (e) {
      return Result.failure(SavePokemonError("Algo Inesperado Aconteceu"));
    }
  }
}
