import 'package:flutter/material.dart';
import 'package:games_list/ui/ui.dart';

class GameDescription extends StatelessWidget {
  const GameDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BaseContainer(
      margin: const .symmetric(horizontal: 16, vertical: 8),
      padding: .all(8),
      child: Column(
        children: [
          Padding(
            padding: const .symmetric(vertical: 8),
            child: Text("Описание игры", style: theme.textTheme.headlineMedium),
          ),
          Text(description, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
