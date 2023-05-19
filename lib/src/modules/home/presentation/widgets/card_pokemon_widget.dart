import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardPokemonWidget extends StatelessWidget {
  const CardPokemonWidget({
    super.key,
    required this.title,
    required this.cod,
    required this.onPressed,
    required this.urlImagePokemon,
  });

  final String title;
  final String cod;
  final Function() onPressed;
  final String urlImagePokemon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 250,
        width: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.2),
              spreadRadius: 0,
              blurRadius: 6,
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                cod,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ),
            Expanded(
              child: CachedNetworkImage(
                imageUrl: urlImagePokemon,
              ),
            ),
            FittedBox(
              child: Text(
                title.toUpperCase(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
