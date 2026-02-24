import 'package:flutter/material.dart';
import 'package:games_list/ui/ui.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final List<String> genres = ["RPG", "Shooter"];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Text("Фильтрация", style: theme.textTheme.headlineLarge),
        ),

        BaseMultiDialogField(title: "Выберете жанр", selectItems: genres),

        BaseMultiDialogField(title: "Выберете жанр", selectItems: genres),

        BaseMultiDialogField(title: "Выберете жанр", selectItems: genres),

        BaseMultiDialogField(title: "Выберете жанр", selectItems: genres),
      ],
    );
  }
}
