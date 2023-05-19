import 'package:pokedex_snapfi/main.dart';

class SaveSearchedPokemonHistoryData
    implements ISaveSearchedPokemonHistoryData {

  SaveSearchedPokemonHistoryData(this._client);

  final ISharedPreference _client;

  @override
  Future<bool> call(Map<String, dynamic> newHistory) async {
    await _client.saveMap(
      PokedexConstants.pokemonHistoryKey,
      newHistory,
    );

    return true;
  }
}
