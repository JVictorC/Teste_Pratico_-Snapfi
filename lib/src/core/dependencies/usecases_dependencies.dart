
import 'package:pokedex_snapfi/main.dart';

initUseCasesDependencies() {
  I.registesDependency<IGetPokemonUsecase>(
    GetPokemonUsecase(
      repository: I.get<IGetPokemonRepository>(),
    ),
  );


  I.registesDependency<ISaveSearchedPokemonHistoryUseCase>(
    SaveSearchedPokemonHistoryUseCase(
      repository: I.get<ISaveSearchedPokemonHistoryRepository>(),
    ),
  );

  I.registesDependency<IReadSearchedPokemonHistoryUseCase>(
    ReadSearchedPokemonHistoryUseCase(
      repository: I.get<IReadSearchedPokemonHistoryRepository>(),
    ),
  );
}
