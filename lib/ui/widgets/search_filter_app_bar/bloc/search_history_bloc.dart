import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:games_list/repositories/search_history/search_history.dart';

part 'search_history_event.dart';
part 'search_history_state.dart';

class SearchHistoryBloc extends Bloc<SearchHistoryEvent, SearchHistoryState> {
  SearchHistoryBloc({
    required SearchHistoryRepositoryInterface historyRepository,
  }) : _historyRepository = historyRepository,
       super(SearchHistoryInitial()) {
    on<LoadSearchHistory>(_onLoad);
  }

  final SearchHistoryRepositoryInterface _historyRepository;

  void _onLoad(LoadSearchHistory event, Emitter<SearchHistoryState> emit) {
    try {
      final games = _historyRepository.getHistoryList();
      emit(SearchHistoryLoaded(games: games));
    } catch (e) {
      emit(SearchHistoryFailure(error: e));
    }
  }
}
