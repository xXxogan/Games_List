import 'package:games_list/repositories/collection/collection.dart';

abstract interface class CollectionRepositoryInterface {
  void addToCollection(CollectionItem game);
  void removeFromCollection(int gameId);
  List<CollectionItem> getGamesByType(CollectionType type);
  CollectionType? getGameCollectionType(int gameId);
  void moveToCollection(int gameId, CollectionType newType);
}
