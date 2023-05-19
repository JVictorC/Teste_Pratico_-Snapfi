import 'package:flutter/material.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({
    super.key,
    required this.image,
    required this.value,
    required this.title,
  });

  final String image;
  final String value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              "assets/images/$image",
              height: 20,
              width: 20,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                    fontSize: 14,
                  ),
            ),
          ],
        ),
        const SizedBox(
          height: 10
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w200,
                fontSize: 10,
              ),
        ),
      ],
    );
  }
}
