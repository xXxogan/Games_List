import 'package:flutter/material.dart';

class SortButton extends StatelessWidget {
  const SortButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.sort_outlined),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      itemBuilder: (BuildContext context) {
        final ThemeData theme = Theme.of(context);

        return [
          PopupMenuItem(
            enabled: false,
            child: Text("Сортировать игры", style: theme.textTheme.bodyMedium),
          ),
          PopupMenuItem(
            child: Text("По дате выхода", style: theme.textTheme.bodySmall),
          ),
          PopupMenuItem(
            child: Text("По рейтингу", style: theme.textTheme.bodySmall),
          ),
          PopupMenuItem(
            child: Text("По популярности", style: theme.textTheme.bodySmall),
          ),
          PopupMenuItem(
            child: Text("По алфавиту", style: theme.textTheme.bodySmall),
          ),
        ];
      },
    );
  }
}
