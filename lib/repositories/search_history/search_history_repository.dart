import 'package:games_list/repositories/search_history/search_history.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class SearchHistoryRepository implements SearchHistoryRepositoryInterface {
  static const String boxName = "history";

  Box<SearchHistoryWord> get _box => Hive.box<SearchHistoryWord>(boxName);

  @override
  List<SearchHistoryWord> getHistoryList() {
    return _box.values.toList()..sort((a, b) => b.addedAt.compareTo(a.addedAt));
  }

  @override
  void setWord(SearchHistoryWord word) {
    _box.put(word.id, word);
  }

  @override
  void clear() {
    _box.deleteAll(_box.values);
  }
}
