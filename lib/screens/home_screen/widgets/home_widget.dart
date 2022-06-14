import 'package:flutter/material.dart';
import 'package:reddit_ui_clone/models/post.dart';

import 'home_posts_header_container.dart';
import 'popular_posts_header_container.dart';
import 'post_card.dart';
import 'trending_container.dart';

class HomeWidget extends StatefulWidget {

  const HomeWidget({
    Key? key
  }) : super(key: key);


  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {

  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 2.0,
                        offset: const Offset(2.0, 2.0),
                      )
                    ]),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 180,
                  child: TabBar(
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey.shade600,
                      indicatorColor: Theme.of(context).colorScheme.secondary,
                      tabs: const [
                        Tab(text: "Home"),
                        Tab(text: "Popular"),
                      ]),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: const [
            HomeTabView(),
            PopularTabView(),
          ],
        ));
  }
}


class PopularTabView extends StatelessWidget {
  const PopularTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const PopularPostsHeaderContainer(),
        const TrendingContainer(),
        const SizedBox(height: 8.0),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: Post.posts.length,
            itemBuilder: (context, index) {
              final post = Post.posts[index];
              return PostCard(post: post);
            }),
      ],
    );
  }
}

class HomeTabView extends StatelessWidget {
  const HomeTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const HomePostHeaderContainer(),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: Post.posts.length,
            itemBuilder: (context, index) {
              final post = Post.posts[index];
              return PostCard(post: post);
            }),
      ],
    );
  }
}