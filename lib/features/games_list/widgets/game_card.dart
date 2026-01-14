import 'package:flutter/material.dart';
import 'package:games_list/ui/ui.dart';

class GameCard extends StatefulWidget {
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
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: widget.onTap,
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
                  Image.network(
                    widget.image ?? "",
                    fit: .cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset("assets/witcher.png");
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return CircularProgressIndicator();
                    },
                  ),
                  Container(
                    color: theme.hintColor.withAlpha(150),
                    alignment: Alignment.center,
                    child: Text(
                      widget.name,
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
