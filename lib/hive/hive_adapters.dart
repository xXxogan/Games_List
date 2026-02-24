import 'package:games_list/repositories/collection/collection.dart';
import 'package:games_list/repositories/search_history/search_history.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

@GenerateAdapters([
  AdapterSpec<CollectionItem>(),
  AdapterSpec<CollectionType>(),
  AdapterSpec<SearchHistoryWord>(),
])
part 'hive_adapters.g.dart';
