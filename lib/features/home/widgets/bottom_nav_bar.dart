import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TabsRouter tabsRouter = AutoTabsRouter.of(context);

    return BottomNavigationBar(
      selectedLabelStyle: theme.textTheme.labelSmall,
      selectedItemColor: theme.colorScheme.primary,
      unselectedLabelStyle: theme.textTheme.labelSmall,
      iconSize: 30,
      currentIndex: tabsRouter.activeIndex,
      onTap: tabsRouter.setActiveIndex,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "Список игр"),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Коллекция"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Настройки"),
      ],
    );
  }
}
