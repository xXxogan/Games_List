import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:games_list/api/api.dart';
import 'package:games_list/features/games_list/bloc/games_list_bloc.dart';
import 'package:games_list/router/router.dart';
import 'package:games_list/ui/ui.dart';

class GamesListApp extends StatefulWidget {
  const GamesListApp({super.key});

  @override
  State<GamesListApp> createState() => _GamesListAppState();
}

class _GamesListAppState extends State<GamesListApp> {
  final _router = AppRouter();

  late final GamesApiClient _apiClient;

  @override
  void initState() {
    super.initState();
    _apiClient = GamesApiClient.create(apiUrl: dotenv.get("API_BASE_URL"));
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider<GamesApiClient>.value(value: _apiClient)],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GamesListBloc(apiClient: _apiClient),
          ),
        ],
        child: MaterialApp.router(
          title: "Game Dude",
          theme: theme,
          routerConfig: _router.config(),
        ),
      ),
    );
  }
}
