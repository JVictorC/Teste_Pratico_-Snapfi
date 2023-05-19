import 'package:pokedex_snapfi/src/core/core.dart';
import 'package:pokedex_snapfi/main.dart';

initCubitDependencies() {
  I.registesDependency<HomePageCubit>(
    HomePageCubit(
      getPokemonUsecase: I.get<IGetPokemonUsecase>(),
      readSearchedPokemonHistoryUseCase: I.get<IReadSearchedPokemonHistoryUseCase>(),
      saveSearchedPokemonHistoryUseCase: I.get<ISaveSearchedPokemonHistoryUseCase>(),
    ),
  );
}
