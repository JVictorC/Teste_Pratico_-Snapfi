import 'package:pokedex_snapfi/main.dart';

class ReadSearchedPokemonHistoryRepository implements IReadSearchedPokemonHistoryRepository {

  ReadSearchedPokemonHistoryRepository(
    this.data,
  );

  final IReadSearchedPokemonHistoryData data;

  @override
  Future<Result<ReadPokemonHistoryError, List<PokemonEntity>>> call() async {
    try {
      final pokemonList = await data();

      return Result.success(pokemonList);
    } catch (e) {
      return Result.failure(
        ReadPokemonHistoryError(
          "Algo Inesperado Aconteceu",
        ),
      );
    }
  }
}
