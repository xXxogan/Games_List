import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:games_list/features/games_list/games_list.dart';
import 'package:games_list/ui/ui.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    super.key,
    required this.onTap,
    required this.name,
    this.image,
  });

  final GestureTapCallback onTap;
  final String name;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: BaseContainer(
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: GameImage(image: image, fit: .cover),
                        ),
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: ColoredBox(
                              color: Colors.black.withAlpha(50),
                            ),
                          ),
                        ),
                        Center(
                          child: GameImage(image: image, fit: .contain),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: theme.hintColor.withAlpha(150),
                    alignment: Alignment.center,
                    child: Text(
                      name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
