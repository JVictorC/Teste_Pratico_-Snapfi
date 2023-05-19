import 'package:pokedex_snapfi/main.dart';

abstract class IReadSearchedPokemonHistoryRepository {
  Future<Result<ReadPokemonHistoryError, List<PokemonEntity>>> call();
}