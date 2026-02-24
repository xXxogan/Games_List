import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:games_list/features/home/home.dart';
import 'package:games_list/router/router.gr.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [GamesListRoute(), CollectionRoute(), SettingsRoute()],
      bottomNavigationBuilder: (_, child) {
        return BottomNavBar();
      },
    );
  }
}
