import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_snapfi/main.dart';
import 'package:pokedex_snapfi/src/modules/details_pokemon/presentation/widgets/linear_grafic.dart';

class DetailsPokemonPage extends StatefulWidget {
  const DetailsPokemonPage({super.key});

  @override
  State<DetailsPokemonPage> createState() => _DetailsPokemonPageState();
}

class _DetailsPokemonPageState extends State<DetailsPokemonPage> {
  Color _getColorPokemon(String type) {
    switch (type) {
      case "normal":
        return const Color(0XFF49D0B0);
      case "fighting":
        return const Color(0XFFF1AFB2);
      case "flying":
        return const Color(0XFF9E81A9);
      case "poison":
        return const Color(0XFFF1AFB2);
      case "ground":
        return const Color(0XFF2E7885);
      case "rock":
        return const Color(0XFFF38333);
      case "bug":
        return const Color(0XFFF3656B);
      case "ghost":
        return const Color(0XFF3656BF);
      case "steel":
        return const Color(0XFF2E7885);
      case "fire":
        return const Color(0XFFF1AFB2);
      case "water":
        return const Color(0XFF2E7885);
      case "grass":
        return const Color(0XFF49D0B0);
      case "electric":
        return const Color(0XFFF49D0B);
      case "psychic":
        return const Color(0XFF2E7885);
      case "ice":
        return const Color(0XFF2E7885);
      case "dragon":
        return const Color(0XFF9E81A9);
      case "dark":
        return const Color(0XFF383332);
      case "fairy":
        return const Color(0XFFF1AFB2);
      case "unknown":
        return const Color(0XFFF1AFB2);
      case "shadow":
        return const Color(0XFF383332);
      default:
        return const Color(0XFFF1AFB2);
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    final PokemonEntity pokemonDetail = arguments["pokemon"];

    return StructureBase(
      backgroundColor: _getColorPokemon(pokemonDetail.type.first),
      appBar: BaseAppBar(
        title: Row(
          children: [
            Text(
              pokemonDetail.name.toFirstLatterUpperCase(),
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Spacer(),
            Text(
              pokemonDetail.toFormattedCodPokemon,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        hasMenu: false,
        onTapBack: () => Navigator.of(context).pushNamedAndRemoveUntil(
          PokedexRoutes.homePage,
          (_) => false,
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .3,
                    left: 10,
                    right: 10),
                height: MediaQuery.of(context).size.height * .52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: pokemonDetail.type
                          .map(
                            (e) => TypePokemonColor(typePokemon: e),
                          )
                          .toList(),
                    ),
                    Text(
                      "About",
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: _getColorPokemon(
                                  pokemonDetail.type.first,
                                ),
                              ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AboutCard(
                            image: "weight_icon.png",
                            value: pokemonDetail.toFormattedWeightPokemon,
                            title: "Weight",
                          ),
                          const CustomDivider(),
                          AboutCard(
                            image: "height_icon.png",
                            value: pokemonDetail.toFormattedHeightPokemon,
                            title: "Height",
                          ),
                          const CustomDivider(),
                          AboutCardMoves(
                            value: pokemonDetail.moves,
                            title: "Moves",
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            key: const Key("DetailsPageStatus"),
                            children: [
                              LinearGraphic(
                                label: "HP",
                                points: pokemonDetail.healthPoints,
                                value: pokemonDetail.healthPoints,
                                color: _getColorPokemon(
                                  pokemonDetail.type.first,
                                ),
                              ),
                              LinearGraphic(
                                label: "ATK",
                                points: pokemonDetail.strengthPoints,
                                value: pokemonDetail.defensePoints,
                                color: _getColorPokemon(
                                  pokemonDetail.type.first,
                                ),
                              ),
                              LinearGraphic(
                                label: "DEF",
                                points: pokemonDetail.defensePoints,
                                value: pokemonDetail.strengthPoints,
                                color: _getColorPokemon(
                                  pokemonDetail.type.first,
                                ),
                              ),
                              LinearGraphic(
                                label: "SATK",
                                points: pokemonDetail.specialStrengthPoints,
                                value: pokemonDetail.strengthPoints,
                                color: _getColorPokemon(
                                  pokemonDetail.type.first,
                                ),
                              ),
                              LinearGraphic(
                                label: "SDEF",
                                points: pokemonDetail.specialDefensePoints,
                                value: pokemonDetail.strengthPoints,
                                color: _getColorPokemon(
                                  pokemonDetail.type.first,
                                ),
                              ),
                              LinearGraphic(
                                label: "SPD",
                                points: pokemonDetail.speedPoints,
                                value: pokemonDetail.strengthPoints,
                                color: _getColorPokemon(
                                  pokemonDetail.type.first,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .5,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      child: Image.asset(
                        "assets/images/pokeball_background.png",
                        height: 300,
                        width: 250,
                      ),
                    ),
                    Center(
                      child: CachedNetworkImage(
                        key: const Key("DetailsPageImage"),
                        imageUrl: pokemonDetail.imagePokemon,
                        height: 300,
                        width: 300,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
