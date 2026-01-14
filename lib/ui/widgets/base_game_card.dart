import 'package:flutter/material.dart';
import 'package:games_list/ui/widgets/widgets.dart';

class BaseGameCard extends StatelessWidget {
  const BaseGameCard({super.key, required this.icon, required this.onTap});

  final Icon icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: BaseContainer(
        margin: EdgeInsets.symmetric(horizontal: 16),
        height: 70,
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.asset("assets/witcher.png", fit: BoxFit.cover),
            ),

            Text("Ведьмак 3. Дикая Охота.", style: theme.textTheme.labelMedium),

            IconButton(
              onPressed: () {},
              icon: icon,
              color: theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
