import 'package:pokedex_snapfi/main.dart';

initRepositoriesDependencies() {
  I.registesDependency<IGetPokemonRepository>(
    GetPokemonRepository(I.get<IGetPokemonData>()),
  );

  I.registesDependency<ISaveSearchedPokemonHistoryRepository>(
    SaveSearchedPokemonHistoryRepository(
      I.get<IReadSearchedPokemonHistoryData>(),
      I.get<ISaveSearchedPokemonHistoryData>(),
    ),
  );

  I.registesDependency<IReadSearchedPokemonHistoryRepository>(
    ReadSearchedPokemonHistoryRepository(
      I.get<IReadSearchedPokemonHistoryData>(),
    ),
  );
}
