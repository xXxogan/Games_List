import 'package:flutter/material.dart';
import 'package:games_list/ui/ui.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiDialogField extends StatelessWidget {
  const MultiDialogField({
    super.key,
    required this.title,
    required this.selectItems,
  });

  final String title;
  final List<String> selectItems;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: BaseContainer(
        color: theme.colorScheme.surfaceContainerHighest,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: MultiSelectDialogField(
          title: Text(title, style: theme.textTheme.titleLarge),
          buttonText: Text(
            title,
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSurface.withAlpha(120),
            ),
          ),
          buttonIcon: Icon(Icons.arrow_drop_down),
          decoration: BoxDecoration(
            border: BoxBorder.all(style: BorderStyle.none),
          ),
          items: [
            for (var value in selectItems) ...[MultiSelectItem(value, value)],
          ],
          onConfirm: (value) {},
        ),
      ),
    );
  }
}
