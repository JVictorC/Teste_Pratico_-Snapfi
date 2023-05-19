abstract class HomeException implements Exception {
  final String message;

  HomeException(this.message);
}

class GetPokemonError implements HomeException {
  @override
  final String message;

  GetPokemonError(this.message);
}

class SavePokemonError implements HomeException {
  @override
  final String message;

  SavePokemonError(this.message);
}

class ReadPokemonHistoryError implements HomeException {
  @override
  final String message;

  ReadPokemonHistoryError(this.message);
}