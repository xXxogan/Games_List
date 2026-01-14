import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:games_list/features/home/home.dart';
import 'package:games_list/router/router.gr.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [GamesListRoute(), CollectionRoute(), SettingsRoute()],

      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, _) {
              switch (tabsRouter.activeIndex) {
                case 0:
                  return [BaseAppBar(title: "Game Dude")];
                case 1:
                  return [BaseAppBar(title: "Коллекция")];
                case 2:
                  return [];
                default:
                  throw Exception("Ошибка AppBar");
              }
            },

            body: child,
          ),

          bottomNavigationBar: BottomNavBar(),
        );
      },
    );
  }
}
