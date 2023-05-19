import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_snapfi/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomePageCubit _cubit;
  late final TextEditingController _controller;

  @override
  void initState() {
    _staterPage();
    super.initState();
  }

  Future<void> _staterPage() async {
    _cubit = I.get<HomePageCubit>();

    _controller = TextEditingController();

    await _cubit.readPokemonsHistory();
  }

  @override
  Widget build(BuildContext context) {
    return StructureBase(
      child: Column(
        children: [
          HeaderHome(
            cubit: _cubit,
            controller: _controller,
          ),
          Expanded(
            child: BlocConsumer<HomePageCubit, HomePageState>(
              listener: (context, state) {
                if (state is LoadedPokemonState) {
                  Navigator.pushReplacementNamed(
                    context,
                    PokedexRoutes.detailsPokemon,
                    arguments: {
                      "pokemon": state.pokemon,
                    },
                  );
                }
              },
              builder: (context, state) {
                if (state is LoadingSearchPokemon) {
                  return const BaseSearchPokemonsWidget(
                    child: LoadingWidget(),
                  );
                }

                if (state is ErrorSearchPokemonState) {
                  final message = state.message;

                  return BaseSearchPokemonsWidget(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          message,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                }

                return BlocBuilder<HomePageCubit, HomePageState>(
                  builder: (context, state) {
                    if (state is LoadingMostSearch) {
                      return const BaseSearchPokemonsWidget(
                        child: LoadingWidget(),
                      );
                    }

                    return BaseSearchPokemonsWidget(
                      child: _mostSearch(context, _cubit),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _mostSearch(
  BuildContext context,
  HomePageCubit cubit,
) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10),
          BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
              if (state is LoadingMostSearch) {
                return const LoadingWidget();
              }

              if (cubit.pokemonsInHistory.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "Infelizmente, você não fez\nnenhuma Busca",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                      textAlign: TextAlign.center,
                    )
                  ],
                );
              }

              return Wrap(
                spacing: 7,
                runSpacing: 10,
                alignment: WrapAlignment.start,
                children: cubit.pokemonsInHistory
                    .map(
                      (e) => CardPokemonWidget(
                        cod: e.toFormattedCodPokemon,
                        title: e.name,
                        urlImagePokemon: e.imagePokemon,
                        onPressed: () => Navigator.pushReplacementNamed(
                          context,
                          PokedexRoutes.detailsPokemon,
                          arguments: {
                            "pokemon": e,
                          },
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          )
        ],
      ),
    );
