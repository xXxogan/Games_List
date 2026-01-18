part of 'game_bloc.dart';

sealed class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

final class GameInitial extends GameState {}

final class GameLoading extends GameState {}

final class GameLoaded extends GameState {
  const GameLoaded({required this.game});

  final GameDetailsResponse game;

  @override
  List<Object> get props => super.props..addAll([game]);
}

final class GameFailure extends GameState {
  const GameFailure({required this.error});

  final Object error;

  @override
  List<Object> get props => super.props..addAll([error]);
}
