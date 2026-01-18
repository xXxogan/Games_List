part of 'game_bloc.dart';

sealed class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

final class GetGameById extends GameEvent {
  const GetGameById({required this.id});

  final int id;

  @override
  List<Object> get props => super.props..addAll([id]);
}
