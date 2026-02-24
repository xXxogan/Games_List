import 'package:games_list/repositories/collection/collection.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class CollectionRepository implements CollectionRepositoryInterface {
  static const String boxName = "collection";

  Box<CollectionItem> get _box => Hive.box<CollectionItem>(boxName);

  @override
  void addToCollection(CollectionItem game) {
    _box.put(game.id, game);
  }

  @override
  void removeFromCollection(int gameId) {
    _box.delete(gameId);
  }

  @override
  List<CollectionItem> getGamesByType(CollectionType type) {
    return _box.values.where((game) => game.type == type).toList()
      ..sort((a, b) => b.addedAt.compareTo(a.addedAt));
  }

  @override
  CollectionType? getGameCollectionType(int gameId) {
    return _box.get(gameId)?.type;
  }

  @override
  void moveToCollection(int gameId, CollectionType newType) {
    final currentGame = _box.get(gameId);

    if (currentGame != null) {
      final newGame = currentGame.copyWith(
        type: newType,
        addedAt: DateTime.now(),
      );

      _box.put(gameId, newGame);
    }
  }
}
