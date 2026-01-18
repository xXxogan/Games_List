import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_list/features/games_list/bloc/games_list_bloc.dart';
import 'package:games_list/features/games_list/games_list.dart';
import 'package:games_list/router/router.gr.dart';

@RoutePage()
class GamesListScreen extends StatefulWidget {
  const GamesListScreen({super.key});

  @override
  State<GamesListScreen> createState() => _GamesListScreenState();
}

class _GamesListScreenState extends State<GamesListScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<GamesListBloc>().add(SearchGames());
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        return context.read<GamesListBloc>().add(SearchGamesRefresh());
      },
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 25)),

          BlocBuilder<GamesListBloc, GamesListState>(
            builder: (context, state) {
              switch (state) {
                case GamesListInitial _:
                case GamesListLoading _:
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );

                case GamesListLoaded state:
                  final games = state.games.results;

                  return SliverList.separated(
                    itemCount: games.length,
                    itemBuilder: (context, index) => GameCard(
                      onTap: () {
                        context.pushRoute(GameRoute(gameId: games[index].id));
                      },
                      name: games[index].name,
                      image: games[index].bgImage,
                    ),
                    separatorBuilder: (context, _) => const Divider(height: 25),
                  );

                case GamesListFailure state:
                  return SliverFillRemaining(
                    child: Center(child: Text(state.error.toString())),
                  );
              }
            },
          ),
        ],
      ),
    );
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll <= 300) {
      final bloc = context.read<GamesListBloc>();
      final state = bloc.state;

      if (state is GamesListLoaded && state.games.next != null) {
        bloc.add(SearchMoreGames());
      }
    }
  }
}
