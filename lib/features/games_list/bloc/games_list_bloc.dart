import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_list/api/api.dart';
import 'package:games_list/api/models/models.dart';
import 'package:games_list/repositories/search_history/search_history.dart';
import 'package:uuid/uuid.dart';

part 'games_list_event.dart';
part 'games_list_state.dart';

class GamesListBloc extends Bloc<GamesListEvent, GamesListState> {
  GamesListBloc({required GamesApiClient apiClient, required historyRepository})
    : _historyRepository = historyRepository,
      _apiClient = apiClient,
      super(GamesListInitial()) {
    on<SearchGames>(_onLoad);
    on<SearchMoreGames>(_onLoadMore, transformer: droppable());
    on<SearchGamesRefresh>(_onRefresh);
  }

  final GamesApiClient _apiClient;
  final SearchHistoryRepository _historyRepository;

  Future<void> _onLoad(SearchGames event, Emitter<GamesListState> emit) async {
    try {
      if (state is! GamesListLoaded) {
        emit(GamesListLoading());
      }
      final response = await _apiClient.getGamesList(
        page: 1,
        pageSize: event.pageSize,
        search: event.search,
      );
      emit(GamesListLoaded(games: response, search: event.search));

      if (event.search != null && event.search!.isNotEmpty) {
        final historyWord = SearchHistoryWord(
          id: Uuid().v4().toString(),
          history: event.search!,
          addedAt: DateTime.now(),
        );
        
        _historyRepository.setWord(historyWord);
      }
      // final historyGames = response
    } catch (e) {
      emit(GamesListFailure(error: e));
    }
  }

  Future<void> _onLoadMore(
    SearchMoreGames event,
    Emitter<GamesListState> emit,
  ) async {
    final currentState = state;

    if (currentState is! GamesListLoaded) return;
    if (currentState.games.next == null) return;

    try {
      final currentSearch = currentState.search;
      final nextPage = (currentState.games.results.length ~/ 20) + 1;
      final response = await _apiClient.getGamesList(
        page: nextPage,
        search: currentSearch,
      );

      final newGamesList = List.of(currentState.games.results)
        ..addAll(response.results);
      final newResponse = response.copyWith(results: newGamesList);

      emit(GamesListLoaded(games: newResponse, search: currentSearch));
    } on Exception catch (_) {}
  }

  Future<void> _onRefresh(
    SearchGamesRefresh event,
    Emitter<GamesListState> emit,
  ) async {
    try {
      final response = await _apiClient.getGamesList(page: 1);

      emit(GamesListLoaded(games: response));
    } catch (e) {
      emit(GamesListFailure(error: e));
    }
  }
}
