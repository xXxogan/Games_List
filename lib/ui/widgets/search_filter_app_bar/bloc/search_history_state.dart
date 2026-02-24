part of 'search_history_bloc.dart';

sealed class SearchHistoryState extends Equatable {
  const SearchHistoryState();

  @override
  List<Object> get props => [];
}

final class SearchHistoryInitial extends SearchHistoryState {}

final class SearchHistoryLoading extends SearchHistoryState {}

final class SearchHistoryLoaded extends SearchHistoryState {
  const SearchHistoryLoaded({required this.games});

  final List<SearchHistoryWord> games;

  @override
  List<Object> get props => super.props..add(games);
}

final class SearchHistoryFailure extends SearchHistoryState {
  const SearchHistoryFailure({required this.error});

  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}
