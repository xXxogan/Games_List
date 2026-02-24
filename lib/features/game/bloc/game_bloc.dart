import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_list/api/api.dart';
import 'package:games_list/api/models/models.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({required GamesApiClient apiClient})
    : _apiClient = apiClient,
      super(GameInitial()) {
    on<GetGameById>(_onLoad);
  }

  final GamesApiClient _apiClient;

  Future<void> _onLoad(GetGameById event, Emitter<GameState> emit) async {
    try {
      if (state is! GameLoaded) {
        emit(GameLoading());
      }
      final response = await _apiClient.getGameById(event.id);
      emit(GameLoaded(game: response));
    } catch (e) {
      emit(GameFailure(error: e));
    }
  }
}
