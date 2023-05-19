import 'dart:convert';

import 'package:pokedex_snapfi/main.dart';

final mockJson = {
  "data": [
    jsonEncode(
      {
        "imagePokemon":
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
        "name": "pikachu",
        "id": "25",
        "type": ["electric"],
        "healthPoints": "35",
        "strengthPoints": "55",
        "defensePoints": "40",
        "moves": [],
        "height": 4,
        "specialDefensePoints": "50",
        "specialStrengthPoints": "50",
        "speedPoints": "90",
        "weight": 60,
      },
    ),
  ],
};

final mockPokemon = mockJson["data"]
    ?.map(
      (e) => PokemonModel.fromHistory(e),
    )
    .toList();
