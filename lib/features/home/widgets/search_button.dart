import 'package:flutter/material.dart';
import 'package:games_list/ui/ui.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
    required this.onTap,
    required this.controller,
  });

  final GestureTapCallback onTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: BaseContainer(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 8).copyWith(bottom: 14),
        color: theme.hintColor.withAlpha(40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.search, color: theme.hintColor),

            SizedBox(width: 8),

            AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return Text(
                  controller.text.isEmpty ? "Поиск игры..." : controller.text,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withAlpha(120),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
