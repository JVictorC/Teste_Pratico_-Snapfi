import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_snapfi/main.dart';
import '../../../../../mock/pokemon_mock.dart';

class GetPokemonRepositoryMock extends Mock implements IGetPokemonRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(FilterTypeEntity.name);
  });

  final getPokemonRepositoryMock = GetPokemonRepositoryMock();
  final getPokemonUsecase = GetPokemonUsecase(
    repository: getPokemonRepositoryMock,
  );


  group(
    'GetPokemonUsecase =>',
    () {
      group(
        'Success Cases =>',
        () {
          group(
            'Set ups',
            () {
              setUpAll(() {
                when(
                  () => getPokemonRepositoryMock(
                    any(),
                    any(),
                    any(),
                  ),
                ).thenAnswer(
                  (invocation) async => const Result.success(
                    mockPokemon,
                  ),
                );
              });
            },
          );

          test(
            'Should return a Result',
            () async {
              final result = await getPokemonUsecase(
                filterTypeEntity: FilterTypeEntity.name,
                namePokemon: "Pokemon teste",
              );

              expect(result, isA<Result>());
            },
          );

          test(
            'Should return a PokemonEntity when repository returns a Success result',
            () async {
              final result = await getPokemonUsecase(
                filterTypeEntity: FilterTypeEntity.name,
                namePokemon: "Pokemon teste",
              );

              expect(result.isError, isFalse);
              expect(result.isSuccess, isTrue);

              final valueSuccess = result.value;

              expect(valueSuccess, isA<PokemonEntity>());

              expect(valueSuccess, mockPokemon);
            },
          );

          test(
            'Should return a PokemonEntity when repository returns a Success result and passed pokemon number',
            () async {
              final result = await getPokemonUsecase(
                filterTypeEntity: FilterTypeEntity.number,
                numberPokemon: "123",
              );

              expect(result.isError, isFalse);
              expect(result.isSuccess, isTrue);

              final valueSuccess = result.value;

              expect(valueSuccess, isA<PokemonEntity>());

              expect(valueSuccess, mockPokemon);
            },
          );
        },
      );

      group(
        'Error Cases =>',
        () {
          group(
            'Set ups',
            () {
              setUpAll(() {
                when(
                  () => getPokemonRepositoryMock(
                    any(),
                    any(),
                    any(),
                  ),
                ).thenAnswer(
                  (invocation) async => Result.failure(
                    GetPokemonError("Erro para teste"),
                  ),
                );
              });
            },
          );

          test(
            'Should return a Result',
            () async {
              final result = await getPokemonUsecase(
                filterTypeEntity: FilterTypeEntity.name,
                namePokemon: "Pokemon teste",
              );

              expect(result, isA<Result>());
            },
          );

          test(
            'Should return a GetPokemonError when repository returns a Error result',
            () async {
              final result = await getPokemonUsecase(
                filterTypeEntity: FilterTypeEntity.name,
                namePokemon: "Pokemon teste",
              );

              expect(result.isError, isTrue);
              expect(result.isSuccess, isFalse);

              final valueError = result.error;

              expect(valueError, isA<GetPokemonError>());

              expect(valueError?.message, "Erro para teste");
            },
          );

          group(
            'Set ups',
            () {
              setUpAll(() {
                when(
                  () => getPokemonRepositoryMock(
                    any(),
                    any(),
                    any(),
                  ),
                ).thenAnswer(
                  (invocation) async => const Result.success(
                    mockPokemon,
                  ),
                );
              });
            },
          );
        },
      );
    },
  );
}
