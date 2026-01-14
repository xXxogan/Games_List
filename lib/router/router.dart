import 'package:auto_route/auto_route.dart';
import 'package:games_list/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      initial: true,
      path: "/",
      children: [
        AutoRoute(page: GamesListRoute.page, path: "games_list", initial: true),
        AutoRoute(page: CollectionRoute.page, path: "collection"),
        AutoRoute(page: SettingsRoute.page, path: "settings"),
      ],
    ),
    AutoRoute(page: GameRoute.page, path: "/game"),
  ];
}
