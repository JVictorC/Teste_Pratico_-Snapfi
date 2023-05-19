import 'package:flutter/material.dart';

class TextFormFieldSearchPokemon extends StatelessWidget {
  const TextFormFieldSearchPokemon({
    super.key,
    this.onSubmitted,
    this.onChanged,
    this.controller,
  });

  final void Function()? onSubmitted;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(.2),
            spreadRadius: 4,
            blurRadius: 10,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: TextField(
        key: const Key("HomePageTextField"),
        controller: controller,
        onChanged:onChanged,
        onSubmitted: (_) {
          if (onSubmitted != null) onSubmitted!();
        },
        onEditingComplete: onSubmitted,
        onTapOutside: (_) {
          if (onSubmitted != null) onSubmitted!();
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            bottom: 0,
            left: 10,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          prefixIcon: GestureDetector(
            key: const Key("HomePageButtonConfirmTextFormField"),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
