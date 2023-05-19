import 'package:flutter/material.dart';

class AboutCardMoves extends StatelessWidget {
  const AboutCardMoves({
    super.key,
    required this.value,
    required this.title,
  });

  final List<String> value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              height: 80,
              width: 100,
              child: ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Text(
                    value[index],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                  );
                },
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
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
