import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:games_list/games_list_app.dart';
import 'package:games_list/hive/hive_registrar.g.dart';
import 'package:games_list/repositories/collection/collection.dart';
import 'package:games_list/repositories/search_history/search_history.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Hive.initFlutter();
  Hive.registerAdapters();
  await Hive.openBox<CollectionItem>(CollectionRepository.boxName);
  await Hive.openBox<SearchHistoryWord>(SearchHistoryRepository.boxName);

  runApp(GamesListApp());
}
