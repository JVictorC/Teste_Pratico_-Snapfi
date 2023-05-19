import 'package:pokedex_snapfi/main.dart';

abstract class IGetPokemonUsecase {
  Future<Result<GetPokemonError, PokemonEntity>> call({
    String? namePokemon,
    String? numberPokemon,
    required FilterTypeEntity filterTypeEntity,
  });
}

class GetPokemonUsecase implements IGetPokemonUsecase {
  final IGetPokemonRepository _repository;

  GetPokemonUsecase({
    required IGetPokemonRepository repository,
  }) : _repository = repository;

  @override
  Future<Result<GetPokemonError, PokemonEntity>> call({
    String? namePokemon,
    String? numberPokemon,
    required FilterTypeEntity filterTypeEntity,
  }) async =>
      _repository(
        namePokemon,
        numberPokemon,
        filterTypeEntity,
      );
}
