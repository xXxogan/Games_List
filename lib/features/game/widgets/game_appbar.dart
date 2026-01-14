import 'package:flutter/material.dart';
import 'package:games_list/features/game/game.dart';

class GameAppBar extends StatelessWidget {
  const GameAppBar({super.key, this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SliverAppBar(
      pinned: true,
      floating: true,
      snap: true,
      expandedHeight: 150,
      elevation: 50,
      backgroundColor: theme.colorScheme.inverseSurface.withAlpha(200),

      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          shadows: [Shadow(color: Colors.black12)],
        ),
      ),

      actions: [AddToCollectionButton()],

      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1.5,
        centerTitle: true,
        title: Text(
          "Ведьмак 3. Дикая охота.",
          style: theme.textTheme.titleSmall?.copyWith(
            color: Colors.white,
            fontSize: 17,
          ),
        ),

        background: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.transparent, Colors.black87],
          ).createShader(bounds),
          blendMode: BlendMode.darken,
          // TODO: baseImage
          child: Image.network(image!, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
