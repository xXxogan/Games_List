import 'package:games_list/repositories/search_history/search_history.dart';

abstract interface class SearchHistoryRepositoryInterface {
  List<SearchHistoryWord> getHistoryList();
  void setWord(SearchHistoryWord word);
  void clear();
}
