import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_snapfi/main.dart';

import '../../../../../mock/http_client_mock.dart';
import '../../../../../mock/pokemon_mock.dart';

class GetPokemonDataMock extends Mock implements IGetPokemonData {}

void main() {
  final getPokemonDataMock = GetPokemonDataMock();
  final getPokemonRepository = GetPokemonRepository(getPokemonDataMock);

  // final mockJson = {
  //   "stats": [
  //     {
  //       "base_stat": 35,
  //       "effort": 0,
  //       "stat": {"name": "hp", "url": "https://pokeapi.co/api/v2/stat/1/"}
  //     },
  //     {
  //       "base_stat": 55,
  //       "effort": 0,
  //       "stat": {"name": "attack", "url": "https://pokeapi.co/api/v2/stat/2/"}
  //     },
  //     {
  //       "base_stat": 40,
  //       "effort": 0,
  //       "stat": {"name": "defense", "url": "https://pokeapi.co/api/v2/stat/3/"}
  //     },
  //   ],
  //   "types": [
  //     {
  //       "slot": 1,
  //       "type": {
  //         "name": "electric",
  //         "url": "https://pokeapi.co/api/v2/type/13/"
  //       }
  //     }
  //   ],
  //   "name": "pikachu",
  //   "id": 25,
  //   "sprites": {
  //     "other": {
  //       "official-artwork": {
  //         "front_default":
  //             "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png"
  //       },
  //     },
  //   },
  // };

  // final mockPokemon = PokemonModel.fromMap(mockJson);

  group(
    'GetPokemonRepository =>',
    () {
      group(
        'Success Cases =>',
        () {
          group(
            'Set ups',
            () {
              setUpAll(
                () {
                  when(
                    () => getPokemonDataMock(
                      any(),
                    ),
                  ).thenAnswer((invocation) async => mockPokemon);
                },
              );
            },
          );

          test(
            'Should return a Result',
            () async {
              final result = await getPokemonRepository(
                "nome Pokemon Teste",
                null,
                FilterTypeEntity.name,
              );

              expect(result, isA<Result>());
            },
          );

          test(
            'Should return a PokemonEntity when data returns a Success result',
            () async {
              final result = await getPokemonRepository(
                "nome Pokemon Teste",
                null,
                FilterTypeEntity.name,
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
              setUpAll(
                () {
                  when(() => httpClientMock.get(any())).thenThrow(
                    0 / 10,
                  );
                },
              );
            },
          );

          test(
            'Should return a Result',
            () async {
              final result = await getPokemonRepository(
                "nome Pokemon Teste",
                null,
                FilterTypeEntity.name,
              );

              expect(result, isA<Result>());
            },
          );

          test(
            'Should return a GetPokemonError with message "O nome não pode ser Vazio", when passed FilterTypeEntity is name anda pass number pokemon',
            () async {
              final result = await getPokemonRepository(
                null,
                "",
                FilterTypeEntity.name,
              );

              expect(result.isError, isTrue);
              expect(result.isSuccess, isFalse);

              final valueError = result.error;

              expect(valueError, isA<GetPokemonError>());
              expect(valueError?.message, "O nome não pode ser Vazio");
            },
          );

          test(
            'Should return a GetPokemonError with message "O nome não pode ser Vazio", when passed a namePokemon empty',
            () async {
              final result = await getPokemonRepository(
                "",
                null,
                FilterTypeEntity.name,
              );

              expect(result.isError, isTrue);
              expect(result.isSuccess, isFalse);

              final valueError = result.error;

              expect(valueError, isA<GetPokemonError>());
              expect(valueError?.message, "O nome não pode ser Vazio");
            },
          );

          test(
            'Should return a GetPokemonError when data throw a Error result',
            () async {
              final result = await getPokemonRepository(
                 "",
                null,
                FilterTypeEntity.name,
              );

              expect(result.isError, isTrue);
              expect(result.isSuccess, isFalse);

              final valueError = result.error;

              expect(valueError, isA<GetPokemonError>());
            },
          );
        },
      );
    },
  );
}
