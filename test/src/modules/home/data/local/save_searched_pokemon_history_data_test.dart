import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_snapfi/main.dart';

import '../../../../../mock/shared_preferences_mock.dart';

void main() {
  final saveSearchedPokemonHistoryData = SaveSearchedPokemonHistoryData(
    sharedPreferenceMock,
  );

  group(
    'SaveSearchedPokemonHistoryData =>',
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
                    () => sharedPreferenceMock.saveMap(
                      any(),
                      any(),
                    ),
                  ).thenAnswer(
                    (invocation) async => true,
                  );
                },
              );
            },
          );

          test(
            'Should return a Bool',
            () async {
              final result = await saveSearchedPokemonHistoryData(
                {},
              );

              expect(result, isA<bool>());
            },
          );

          test(
            'Should return a true when sharedPreference returns a Success result',
            () async {
              final result = await saveSearchedPokemonHistoryData(
                {},
              );

              expect(result, isTrue);
            },
          );
        },
      );
    },
  );
}
