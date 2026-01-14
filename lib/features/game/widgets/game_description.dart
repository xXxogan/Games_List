import 'package:flutter/material.dart';
import 'package:games_list/ui/ui.dart';

class GameDescription extends StatelessWidget {
  const GameDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BaseContainer(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text("Описание игры", style: theme.textTheme.headlineMedium),
          ),
          Text(
            "\r Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut lectus sed mauris ornare sodales. \n Etiam posuere diam et tellus viverra venenatis. Curabitur dictum, augue in ullamcorper rutrum, ipsum mauris dignissim ligula, id feugiat sapien justo sit amet purus. Pellentesque maximus, nisl in consequat ullamcorper, sem odio aliquam nulla, non auctor dui nunc non urna. Proin eleifend urna vehicula dolor sollicitudin, eu gravida sem luctus. Sed malesuada neque id lectus fermentum finibus. \n Sed ac pulvinar orci. Sed mattis odio vel risus pretium, sit amet ultrices libero feugiat. Sed at consequat arcu. Vestibulum placerat, orci nec mattis mattis, erat purus luctus elit, vitae tristique libero erat id felis.",
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
