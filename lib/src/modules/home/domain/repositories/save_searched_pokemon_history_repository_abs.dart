import 'package:pokedex_snapfi/main.dart';

abstract class ISaveSearchedPokemonHistoryRepository {
  Future<Result<SavePokemonError,bool>> call(PokemonEntity pokemon);
}