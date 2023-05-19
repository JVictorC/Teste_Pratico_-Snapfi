import 'package:pokedex_snapfi/main.dart';

initDatasDependencies() {
  I.registesDependency<IGetPokemonData>(
    GetPokemonData(I.get<IHttpClient>()),
  );

  I.registesDependency<IReadSearchedPokemonHistoryData>(
    ReadSearchedPokemonHistoryData(
      I.get<ISharedPreference>(),
    ),
  );

  I.registesDependency<ISaveSearchedPokemonHistoryData>(
    SaveSearchedPokemonHistoryData(
      I.get<ISharedPreference>(),
    ),
  );
}
