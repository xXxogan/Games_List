import 'package:flutter/material.dart';
import 'package:games_list/ui/widgets/widgets.dart';

class SettingsActionCard extends StatelessWidget {
  const SettingsActionCard({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.iconColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: BaseContainer(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        margin: EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: theme.textTheme.bodyLarge),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                icon,
                size: 32,
                color: iconColor ?? theme.colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
