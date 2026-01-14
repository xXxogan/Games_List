import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_list/features/games_list/bloc/games_list_bloc.dart';
import 'package:games_list/features/home/home.dart';
import 'package:games_list/ui/ui.dart';

class BaseAppBar extends StatefulWidget {
  const BaseAppBar({super.key, required this.title});

  final String title;

  @override
  State<BaseAppBar> createState() => _BaseAppBarState();
}

class _BaseAppBarState extends State<BaseAppBar> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocListener<GamesListBloc, GamesListState>(
      listener: (context, state) {
        if (state is GamesListLoaded) {
          if ((state.search == null || state.search!.isEmpty) &&
              _searchController.text.isNotEmpty) {
            _searchController.clear();
          }
        }
        if (state is GamesListInitial) {
          _searchController.clear();
        }
      },
      child: SliverAppBar(
        floating: true,
        pinned: true,
        snap: true,
        elevation: 0,
        title: Text(widget.title, style: theme.textTheme.titleLarge),
        centerTitle: true,
        leading: Image.asset("assets/logo.png"),
        actions: [
          IconButton(
            onPressed: () => showFilterBotomSheet(context, FilterBottomSheet()),
            icon: Icon(Icons.filter_list_alt),
          ),
          SortButton(),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: SearchButton(
            onTap: () => showSearchBotomSheet(context),
            controller: _searchController,
          ),
        ),
      ),
    );
  }

  Future<void> showSearchBotomSheet(BuildContext context) async {
    final bloc = BlocProvider.of<GamesListBloc>(context);

    final data = await showModalBottomSheet<String>(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (context) => BaseBottomSheet(
        child: SearchBottomSheet(controller: _searchController),
      ),
    );

    if (data?.isNotEmpty ?? false) {
      bloc.add(SearchGames(search: data));
    }
  }
}

Future<void> showFilterBotomSheet(
  BuildContext context,
  Widget childBottomSheet,
) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    context: context,
    builder: (context) => BaseBottomSheet(child: childBottomSheet),
  );
}
