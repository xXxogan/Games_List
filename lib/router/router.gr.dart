// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:games_list/features/collection/view/collection_screen.dart'
    as _i1;
import 'package:games_list/features/game/view/game_screen.dart' as _i2;
import 'package:games_list/features/games_list/view/games_list_screen.dart'
    as _i3;
import 'package:games_list/features/home/view/home_screen.dart' as _i4;
import 'package:games_list/features/settings/view/settings_screen.dart' as _i5;

/// generated route for
/// [_i1.CollectionScreen]
class CollectionRoute extends _i6.PageRouteInfo<void> {
  const CollectionRoute({List<_i6.PageRouteInfo>? children})
    : super(CollectionRoute.name, initialChildren: children);

  static const String name = 'CollectionRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.CollectionScreen();
    },
  );
}

/// generated route for
/// [_i2.GameScreen]
class GameRoute extends _i6.PageRouteInfo<GameRouteArgs> {
  GameRoute({
    _i7.Key? key,
    required int gameId,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         GameRoute.name,
         args: GameRouteArgs(key: key, gameId: gameId),
         initialChildren: children,
       );

  static const String name = 'GameRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GameRouteArgs>();
      return _i2.GameScreen(key: args.key, gameId: args.gameId);
    },
  );
}

class GameRouteArgs {
  const GameRouteArgs({this.key, required this.gameId});

  final _i7.Key? key;

  final int gameId;

  @override
  String toString() {
    return 'GameRouteArgs{key: $key, gameId: $gameId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GameRouteArgs) return false;
    return key == other.key && gameId == other.gameId;
  }

  @override
  int get hashCode => key.hashCode ^ gameId.hashCode;
}

/// generated route for
/// [_i3.GamesListScreen]
class GamesListRoute extends _i6.PageRouteInfo<void> {
  const GamesListRoute({List<_i6.PageRouteInfo>? children})
    : super(GamesListRoute.name, initialChildren: children);

  static const String name = 'GamesListRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.GamesListScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.SettingsScreen]
class SettingsRoute extends _i6.PageRouteInfo<void> {
  const SettingsRoute({List<_i6.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SettingsScreen();
    },
  );
}
