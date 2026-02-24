import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:games_list/features/collection/collection.dart';
import 'package:games_list/ui/ui.dart';

@RoutePage()
class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SearchFilterAppBar(title: "Коллекция", searchController: _searchController),
          
          SliverToBoxAdapter(child: SizedBox(height: 25)),

          SliverToBoxAdapter(child: CollectionButton()),

          SliverToBoxAdapter(child: SizedBox(height: 25)),

          SliverList.separated(
            itemBuilder: (context, index) => SmallGameCard(
              icon: Icon(Icons.bookmark),
              onTap: () {
                // context.pushRoute(GameRoute());
              },
            ),
            separatorBuilder: (context, _) => Divider(),
          ),
        ],
      ),
    );
  }
}
