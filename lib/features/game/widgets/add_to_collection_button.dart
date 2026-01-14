import 'package:flutter/material.dart';

class AddToCollectionButton extends StatelessWidget {
  const AddToCollectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            enabled: false,
            child: Text("Добавить игру в", style: theme.textTheme.bodyMedium),
          ),
          PopupMenuItem(
            child: Text("Любимое", style: theme.textTheme.bodySmall),
          ),
          PopupMenuItem(
            child: Text("Пройдено", style: theme.textTheme.bodySmall),
          ),
          PopupMenuItem(
            child: Text("Хочу пройти", style: theme.textTheme.bodySmall),
          ),
          PopupMenuItem(
            child: Text("Брошено", style: theme.textTheme.bodySmall),
          ),
        ];
      },
      icon: Icon(Icons.bookmark_add_outlined, color: Colors.white),
    );
  }
}
