import 'package:flutter/material.dart';

class PlatformsAndRating extends StatelessWidget {
  const PlatformsAndRating({super.key, required this.rating});

  final num rating;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(Icons.gamepad),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(Icons.gamepad),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(Icons.gamepad),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Icon(Icons.star, color: theme.colorScheme.primary),
              Icon(Icons.star, color: theme.colorScheme.primary),
              Icon(Icons.star, color: theme.colorScheme.primary),
              Icon(Icons.star_half, color: theme.colorScheme.primary),
              Icon(Icons.star_border, color: theme.colorScheme.primary),
            ],
          ),
        ),
      ],
    );
  }
}
