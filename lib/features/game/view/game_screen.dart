import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_list/api/api.dart';
import 'package:games_list/features/game/bloc/game_bloc.dart';
import 'package:games_list/features/game/game.dart';
import 'package:games_list/ui/ui.dart';

@RoutePage()
class GameScreen extends StatelessWidget implements AutoRouteWrapper {
  const GameScreen({super.key, required this.gameId});

  final int gameId;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GameBloc(apiClient: context.read<GamesApiClient>())
            ..add(GetGameById(id: gameId)),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          if (state is! GameLoaded) {
            return Center(child: CircularProgressIndicator());
          }
          return CustomScrollView(
            slivers: [
              GameAppBar(image: state.game.bgImage),

              SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Icon(Icons.arrow_drop_up),
                  ),
                ),
              ),

              SliverToBoxAdapter(child: Divider()),

              SliverToBoxAdapter(child: PlatformsAndRating()),

              SliverToBoxAdapter(child: Divider()),

              SliverToBoxAdapter(child: GameDescription()),

              SliverToBoxAdapter(child: SizedBox(height: 16)),

              SliverToBoxAdapter(
                child: BaseContainer(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Разработчик Valve",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: BaseContainer(
                  margin: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ).copyWith(bottom: 32),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Среднее время прохождения: 40ч.",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
