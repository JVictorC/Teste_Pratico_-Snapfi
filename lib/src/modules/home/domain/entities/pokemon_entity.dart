import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class PokemonEntity extends Equatable {
  final String imagePokemon;
  final String name;
  final String id;
  final List<String> type;
  final String healthPoints;
  final String strengthPoints;
  final String defensePoints;
  final int weight;
  final int height;
  final List<String> moves;
  final String specialDefensePoints;
  final String specialStrengthPoints;
  final String speedPoints;

  const PokemonEntity(
    this.imagePokemon,
    this.name,
    this.id,
    this.type,
    this.healthPoints,
    this.strengthPoints,
    this.defensePoints,
    this.weight,
    this.height,
    this.moves,
    this.specialDefensePoints,
    this.specialStrengthPoints,
    this.speedPoints,
  );

  String get toFormattedCodPokemon {
    final formatter = NumberFormat('000');

    return "#${formatter.format(int.parse(id))}";
  }

  String get toFormattedWeightPokemon {
    final formatter = NumberFormat('##,#');

    return "${formatter.format(weight)} KG";
  }

  String get toFormattedHeightPokemon {
    final formatter = NumberFormat('0,0');

    return "${formatter.format(height)} M";
  }

  @override
  List<Object?> get props => [
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
      ];
}
