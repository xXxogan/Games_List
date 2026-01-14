import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:games_list/features/settings/settings.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Настроки", style: theme.textTheme.titleLarge),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.list_alt))],
      ),

      body: Column(
        children: [
          SizedBox(height: 25),
          SettingsToggleCard(
            title: "Темная тема",
            value: true,
            onChanged: (value) {},
          ),
          SettingsToggleCard(
            title: "Уведомления",
            value: true,
            onChanged: (value) {},
          ),
          SettingsToggleCard(
            title: "Разрешить аналитику",
            value: false,
            onChanged: (value) {},
          ),

          SizedBox(height: 12),

          SettingsActionCard(
            title: "Очистить историю",
            icon: Icons.delete,
            iconColor: Colors.red,
          ),
          SettingsActionCard(title: "Поддержка", icon: Icons.message),
        ],
      ),
    );
  }
}
