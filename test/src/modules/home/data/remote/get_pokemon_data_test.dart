import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_snapfi/main.dart';

import '../../../../../mock/http_client_mock.dart';
import '../../../../../mock/mock_json.dart';
import '../../../../../mock/mock_json_api.dart';

void main() {
  final getPokemonData = GetPokemonData(
    httpClientMock,
  );

  group(
    'GetPokemonData =>',
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
                    () => httpClientMock.get(any()),
                  ).thenAnswer(
                    (invocation) async => ClientResponse(
                      body: mockJsonApi,
                      statusCode: 200,
                    ),
                  );
                },
              );
            },
          );

          test(
            'Should return a Pokemons Entity',
            () async {
              final result = await getPokemonData("");

              expect(result, isA<PokemonEntity>());
            },
          );

          test(
            'Should return a PokemonEntity when sharedPreference returns a Success result',
            () async {
              final result = await getPokemonData("");

              expect(result, isA<PokemonEntity>());

              expect(result, mockPokemon?.first);
            },
          );
        },
      );
    },
  );
}
