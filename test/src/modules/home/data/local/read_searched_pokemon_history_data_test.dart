import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_snapfi/main.dart';

import '../../../../../mock/mock_json.dart';
import '../../../../../mock/shared_preferences_mock.dart';

void main() {
  final readSearchedPokemonHistoryData = ReadSearchedPokemonHistoryData(
    sharedPreferenceMock,
  );


  group(
    'readSearchedPokemonHistoryData =>',
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
                    () => sharedPreferenceMock.getMap(any()),
                  ).thenAnswer(
                    (invocation) async => mockJson,
                  );
                },
              );
            },
          );

          test(
            'Should return a List with Pokemons Entities',
            () async {
              final result = await readSearchedPokemonHistoryData();

              expect(result, isA<List<PokemonEntity>>());
            },
          );

          test(
            'Should return a List<PokemonEntity> when sharedPreference returns a Success result',
            () async {
              final result = await readSearchedPokemonHistoryData();

              expect(result, isA<List<PokemonEntity>>());

              expect(result, mockPokemon);
            },
          );
        },
      );
    },
  );
}
