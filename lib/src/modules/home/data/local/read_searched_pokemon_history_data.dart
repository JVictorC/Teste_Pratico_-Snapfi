import 'package:pokedex_snapfi/main.dart';

class ReadSearchedPokemonHistoryData
    implements IReadSearchedPokemonHistoryData {
  ReadSearchedPokemonHistoryData(this._client);

  final ISharedPreference _client;

  @override
  Future<List<PokemonEntity>> call() async {
    final result = await _client.getMap(
      PokedexConstants.pokemonHistoryKey,
    );

    if (result.isEmpty) {
      return [];
    }

    final allPokemonsInHistory = result["data"] as List;

    final pokemonList = allPokemonsInHistory
        .map(
          (e) => PokemonModel.fromHistory(e),
        )
        .toList();

    return pokemonList;
  }
}
