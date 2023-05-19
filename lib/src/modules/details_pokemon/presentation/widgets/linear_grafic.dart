import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokedex_snapfi/main.dart';

class LinearGraphic extends StatelessWidget {
  const LinearGraphic({
    Key? key,
    required this.points,
    required this.value,
    required this.label,
    required this.color,
  }) : super(key: key);

  final String points;
  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("000");


    return Row(
      children: [
        SizedBox(
        width: 35,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
          ),
        ),
        const SizedBox(width: 20),
        const CustomDivider(),
        const SizedBox(width: 20),
        Text(
          formatter.format(int.parse(value)),
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.black),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: LinearProgressIndicator(
            value: double.parse(points) / 100,
            backgroundColor: color.withOpacity(0.3),
            color: color,
            minHeight: 10,
          ),
        )
      ],
    );
  }
}
