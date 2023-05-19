import 'package:pokedex_snapfi/main.dart';

class GetPokemonData implements IGetPokemonData {
  GetPokemonData(this._client);

  final IHttpClient _client;

  @override
  Future<PokemonEntity> call(
    String textSearch,
  ) async {
    final data = await _client.get(
      'https://pokeapi.co/api/v2/pokemon/$textSearch',
    );

    return PokemonModel.fromMap(data.body);
  }
}
