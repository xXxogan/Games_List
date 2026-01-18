import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_list/api/api.dart';
import 'package:games_list/api/models/models.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({required this.apiClient}) : super(GameInitial()) {
    on<GetGameById>(_onLoad);
  }

  final GamesApiClient apiClient;

  Future<void> _onLoad(GetGameById event, Emitter<GameState> emit) async {
    try {
      if (state is! GameLoaded) {
        emit(GameLoading());
      }
      final response = await apiClient.getGameById(event.id);
      emit(GameLoaded(game: response));
    } catch (e) {
      emit(GameFailure(error: e));
    }
  }
}
