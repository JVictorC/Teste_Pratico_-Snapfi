import 'package:flutter/material.dart';

class BaseSearchPokemonsWidget extends StatelessWidget {
  const BaseSearchPokemonsWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(.2),
            spreadRadius: 4,
            blurRadius: 10,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: child,
    );
  }
}
