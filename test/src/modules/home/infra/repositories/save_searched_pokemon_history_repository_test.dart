import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_snapfi/main.dart';

import '../../../../../mock/pokemon_mock.dart';

class PokemonModelFake extends Fake implements PokemonModel {}

class ReadSearchedPokemonHistoryDataMock extends Mock
    implements IReadSearchedPokemonHistoryData {}

class SaveSearchedPokemonHistoryDataMock extends Mock
    implements ISaveSearchedPokemonHistoryData {}

void main() {
  setUpAll(
    () {
      registerFallbackValue(PokemonModelFake());
    },
  );

  final readSearchedPokemonHistoryDataMock =
      ReadSearchedPokemonHistoryDataMock();

  final saveSearchedPokemonHistoryDataMock =
      SaveSearchedPokemonHistoryDataMock();

  final saveSearchedPokemonHistoryRepository =
      SaveSearchedPokemonHistoryRepository(readSearchedPokemonHistoryDataMock,
          saveSearchedPokemonHistoryDataMock);

  // final mockJson = {
  //   "data": [
  //     jsonEncode(
  //       {
  //         "imagePokemon":
  //             "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
  //         "name": "pikachu",
  //         "id": "25",
  //         "type": "electric",
  //         "healthPoints": "35",
  //         "strengthPoints": "55",
  //         "defensePoints": "40",
  //       },
  //     ),
  //   ],
  // };

  group(
    'SaveSearchedPokemonHistoryRepository =>',
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
                    () => saveSearchedPokemonHistoryDataMock(
                      any(),
                    ),
                  ).thenAnswer(
                    (invocation) async => true,
                  );

                  when(
                    () => readSearchedPokemonHistoryDataMock(),
                  ).thenAnswer(
                    (invocation) async => [mockPokemon],
                  );
                },
              );
            },
          );

          test(
            'Should return a Result',
            () async {
              final result =
                  await saveSearchedPokemonHistoryRepository(mockPokemon);

              expect(result, isA<Result>());
            },
          );

          test(
            'Should return a bool when sharedPreference returns a Success result',
            () async {
              final result =
                  await saveSearchedPokemonHistoryRepository(mockPokemon);

              expect(result.isError, isFalse);
              expect(result.isSuccess, isTrue);

              final valueSuccess = result.value;

              expect(valueSuccess, isA<bool>());

              expect(valueSuccess, isTrue);
            },
          );

          test(
            'Should create a new map in memory when not exist data in memory',
            () async {
              when(
                () => readSearchedPokemonHistoryDataMock(),
              ).thenAnswer(
                (invocation) async => [],
              );

              final result =
                  await saveSearchedPokemonHistoryRepository(mockPokemon);

              verify(
                () => saveSearchedPokemonHistoryDataMock(
                  {
                    "data": [
                      mockPokemon.toJson(),
                    ]
                  },
                ),
              );

              expect(result.isError, isFalse);
              expect(result.isSuccess, isTrue);

              final valueSuccess = result.value;

              expect(valueSuccess, isA<bool>());

              expect(valueSuccess, isTrue);
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
                  when(
                    () => readSearchedPokemonHistoryDataMock(),
                  ).thenThrow(
                    0 / 10,
                  );
                },
              );
            },
          );

          test(
            'Should return a Result',
            () async {
              final result =
                  await saveSearchedPokemonHistoryRepository(mockPokemon);

              expect(result, isA<Result>());
            },
          );

          test(
            'Should return a SavePokemonError when sharedPreference throw a Error result',
            () async {
              final result =
                  await saveSearchedPokemonHistoryRepository(mockPokemon);

              expect(result.isError, isTrue);
              expect(result.isSuccess, isFalse);

              final valueError = result.error;

              expect(valueError, isA<SavePokemonError>());
            },
          );
        },
      );
    },
  );
}
