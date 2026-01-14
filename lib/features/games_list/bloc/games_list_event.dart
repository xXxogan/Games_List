part of 'games_list_bloc.dart';

sealed class GamesListEvent extends Equatable {
  const GamesListEvent();

  @override
  List<Object> get props => [];
}

final class SearchGames extends GamesListEvent {
  const SearchGames({this.search, this.pageSize = 20});

  final String? search;
  final int pageSize;

  @override
  List<Object> get props => super.props..addAll([pageSize, ?search]);
}

final class SearchMoreGames extends GamesListEvent {}

final class SearchGamesRefresh extends GamesListEvent {}
