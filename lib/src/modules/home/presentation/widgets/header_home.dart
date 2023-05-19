import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_snapfi/main.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    super.key,
    required this.cubit,
    this.controller,
  });

  final HomePageCubit cubit;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: 24,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset("assets/images/pokeball.png"),
              const SizedBox(width: 16),
              Text(
                "Pokédex",
                style: GoogleFonts.poppins().copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextFormFieldSearchPokemon(
                    controller: controller,
                    onChanged: (t) {
                      if (t.isEmpty) cubit.readPokemonsHistory();
                    },
                    onSubmitted: () async {
                      final text = controller?.text ?? "";

                      if (text.isEmpty) {
                        await cubit.clearSearch();

                        return;
                      }

                      await cubit.getPokemon(text);
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Align(
                        child: FilterSearchPokemonWidget(
                          cubit: cubit,
                        ),
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/images/sort_button.png",
                    height: 50,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
