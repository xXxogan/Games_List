import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:games_list/features/collection/collection.dart';
import 'package:games_list/router/router.gr.dart';

@RoutePage()
class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 25)),

          SliverToBoxAdapter(child: CollectionButton()),

          SliverToBoxAdapter(child: SizedBox(height: 25)),

          SliverList.separated(
            itemBuilder: (context, index) => SmallGameCard(
              icon: Icon(Icons.bookmark),
              onTap: () {
                context.pushRoute(GameRoute());
              },
            ),
            separatorBuilder: (context, _) => Divider(),
          ),
        ],
      ),
    );
  }
}
