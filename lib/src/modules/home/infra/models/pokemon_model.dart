// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pokedex_snapfi/main.dart';

class PokemonModel extends PokemonEntity {
  const PokemonModel({
    required String imagePokemon,
    required String name,
    required String id,
    required List<String> type,
    required String healthPoints,
    required String strengthPoints,
    required String defensePoints,
    required String specialDefensePoints,
    required String specialStrengthPoints,
    required String speedPoints,
    required int weight,
    required int height,
    required List<String> moves,
  }) : super(
          imagePokemon,
          name,
          id,
          type,
          healthPoints,
          strengthPoints,
          defensePoints,
          weight,
          height,
          moves,
          specialDefensePoints,
          specialStrengthPoints,
          speedPoints,
        );

  factory PokemonModel.fromEntity(PokemonEntity e) => PokemonModel(
        imagePokemon: e.imagePokemon,
        name: e.name,
        id: e.id,
        type: e.type,
        healthPoints: e.healthPoints,
        strengthPoints: e.strengthPoints,
        defensePoints: e.defensePoints,
        weight: e.weight,
        height: e.height,
        moves: e.moves,
        specialDefensePoints: e.specialDefensePoints,
        specialStrengthPoints: e.specialStrengthPoints,
        speedPoints: e.speedPoints,
      );

  Map<String, dynamic> toMap() => {
        "imagePokemon": imagePokemon,
        "name": name,
        "id": id,
        "type": type,
        "healthPoints": healthPoints,
        "strengthPoints": strengthPoints,
        "defensePoints": defensePoints,
        "weight": weight,
        "height": height,
        "moves": moves,
        "specialDefensePoints": specialDefensePoints,
        "specialStrengthPoints": specialStrengthPoints,
        "speedPoints": speedPoints,
      };

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      imagePokemon:
          map['sprites']['other']['official-artwork']['front_default'] ?? "",
      name: map['name'] ?? '',
      id: map['id'].toString(),
      type: (map['types'] as List)
          .map(
            (e) => (e["type"]["name"] as String),
          )
          .toList(),
      healthPoints: map["stats"][0]["base_stat"].toString(),
      strengthPoints: map["stats"][1]["base_stat"].toString(),
      defensePoints: map["stats"][2]["base_stat"].toString(),
      specialDefensePoints: map["stats"][3]["base_stat"].toString(),
      specialStrengthPoints: map["stats"][4]["base_stat"].toString(),
      speedPoints: map["stats"][5]["base_stat"].toString(),
      weight: map["weight"],
      height: map["height"],
      moves: (map["moves"] as List)
          .map(
            (e) => e["move"]["name"].toString(),
          )
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromHistory(String source) {
    final map = json.decode(source);

    final List<String> types = [];
    final List<String> moves = [];

    for (var element in map["type"]) {
      types.add(element);
    }

    for (var element in map["moves"]) {
      moves.add(element);
    }


    return PokemonModel(
      imagePokemon: map["imagePokemon"],
      name: map["name"],
      id: map["id"],
      type: types,
      healthPoints: map["healthPoints"],
      strengthPoints: map["strengthPoints"],
      defensePoints: map["defensePoints"],
      weight: map["weight"],
      height: map["height"],
      moves: moves,
      specialDefensePoints: map["specialDefensePoints"],
      specialStrengthPoints: map["specialStrengthPoints"],
      speedPoints: map["speedPoints"],
    );
  }
}
