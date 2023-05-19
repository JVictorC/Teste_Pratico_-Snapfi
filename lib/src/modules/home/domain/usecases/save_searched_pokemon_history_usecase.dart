
import 'package:pokedex_snapfi/main.dart';

abstract class ISaveSearchedPokemonHistoryUseCase {
  Future<Result<SavePokemonError, bool>> call(PokemonEntity pokemon);
}

class SaveSearchedPokemonHistoryUseCase implements ISaveSearchedPokemonHistoryUseCase {
  final ISaveSearchedPokemonHistoryRepository _repository;

  SaveSearchedPokemonHistoryUseCase({
    required ISaveSearchedPokemonHistoryRepository repository,
  }) : _repository = repository;

  @override
  Future<Result<SavePokemonError, bool>> call(PokemonEntity pokemon) =>
      _repository(pokemon);
}
