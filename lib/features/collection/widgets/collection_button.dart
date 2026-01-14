import 'package:flutter/material.dart';
import 'package:games_list/ui/ui.dart';

class CollectionButton extends StatefulWidget {
  const CollectionButton({super.key});

  @override
  State<CollectionButton> createState() => _CollectionButtonState();
}

class _CollectionButtonState extends State<CollectionButton> {
  String _selectedValue = "Любимое";

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BaseContainer(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: DropdownButton<String>(
        value: _selectedValue,
        style: theme.textTheme.bodyMedium,
        isExpanded: true,
        elevation: 0,
        borderRadius: BorderRadius.circular(12),
        // underline: SizedBox(),
        items: [
          DropdownMenuItem(value: "Любимое", child: Text("Любимое")),
          DropdownMenuItem(value: "Пройдено", child: Text("Пройдено")),
          DropdownMenuItem(value: "Хочу пройти", child: Text("Хочу пройти")),
          DropdownMenuItem(value: "Брошено", child: Text("Брошено")),
        ],
        onChanged: (value) {
          setState(() {
            if (value != null) {
              _selectedValue = value;
            }
          });
        },
      ),
    );
  }
}
