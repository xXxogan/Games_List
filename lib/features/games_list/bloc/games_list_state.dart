part of 'games_list_bloc.dart';

sealed class GamesListState extends Equatable {
  const GamesListState();

  @override
  List<Object> get props => [];
}

final class GamesListInitial extends GamesListState {}

final class GamesListLoading extends GamesListState {}

final class GamesListLoaded extends GamesListState {
  const GamesListLoaded({required this.games, this.search});

  final GamesListResponse games;
  final String? search;

  @override
  List<Object> get props => super.props..addAll([games, ?search]);
}

final class GamesListFailure extends GamesListState {
  const GamesListFailure({required this.error});

  final Object error;

  @override
  List<Object> get props => super.props..addAll([error]);
}
