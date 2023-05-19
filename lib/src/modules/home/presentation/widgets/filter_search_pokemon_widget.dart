import 'package:flutter/material.dart';
import 'package:pokedex_snapfi/main.dart';

class FilterSearchPokemonWidget extends StatelessWidget {
  const FilterSearchPokemonWidget({
    super.key,
    required this.cubit,
  });

  final HomePageCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 250,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text("Sort by:",
                    style: Theme.of(context).textTheme.displayLarge),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RadioListTile(
                        activeColor: Theme.of(context).colorScheme.primary,
                        title: Text(
                          "Number",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: Colors.black
                              ),
                        ),
                        value: FilterTypeEntity.number,
                        groupValue: cubit.filterTypeEntity,
                        onChanged: (value) {
                          if (value == null) return;

                          cubit.changeTypeFilter(value);

                          Navigator.pop(context);
                        },
                      ),
                      RadioListTile(
                        activeColor: Theme.of(context).colorScheme.primary,
                        title: Text(
                          "Nome",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        value: FilterTypeEntity.name,
                        groupValue: cubit.filterTypeEntity,
                        onChanged: (value) {
                          if (value == null) return;

                          cubit.changeTypeFilter(value);

                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
