import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_list/features/games_list/bloc/games_list_bloc.dart';
import 'package:games_list/ui/ui.dart';

class SearchFilterAppBar extends StatelessWidget {
  const SearchFilterAppBar({
    super.key,
    required this.title,
    required this.searchController,
  });

  final String title;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocListener<GamesListBloc, GamesListState>(
      listener: (context, state) {
        if (state is GamesListLoaded) {
          if ((state.search == null || state.search!.isEmpty) &&
              searchController.text.isNotEmpty) {
            searchController.clear();
          }
        }
        if (state is GamesListInitial) {
          searchController.clear();
        }
      },
      child: SliverAppBar(
        floating: true,
        pinned: true,
        snap: true,
        elevation: 0,
        title: Text(title, style: theme.textTheme.titleLarge),
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
            controller: searchController,
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
        child: SearchBottomSheet(controller: searchController),
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
