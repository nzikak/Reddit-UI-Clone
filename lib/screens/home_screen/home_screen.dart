import 'package:flutter/material.dart';
import 'package:reddit_ui_clone/models/post.dart';
import 'package:reddit_ui_clone/models/trending_post.dart';
import 'package:reddit_ui_clone/screens/home_screen/widgets/nav_drawer.dart';
import 'package:reddit_ui_clone/screens/home_screen/widgets/popular_posts_header_container.dart';

import 'widgets/home_app_bar.dart';
import 'widgets/post_card.dart';
import 'widgets/home_posts_header_container.dart';
import 'widgets/trending_container.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: const NavDrawer(),
      appBar: const HomeAppBar(),
      endDrawer: const ProfileDrawer(),
      body: NestedScrollView(
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
          )),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavBarItems,
        unselectedItemColor:
            Theme.of(context).colorScheme.onSurface.withAlpha(150),
        selectedItemColor: Theme.of(context).colorScheme.onSurface,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                margin: const EdgeInsets.only(left: 16, right: 10, top: 80),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Icon(
                      Icons.person,
                      size: 250,
                      color: Colors.grey.shade500,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "u/obiWan-kenobi",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.keyboard_arrow_down_sharp)
                        ],
                      ),
                    ),
                    OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.green.shade500),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          visualDensity: VisualDensity.compact
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 16,
                                color: Colors.green.shade500,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "Online Status: On",
                                style: TextStyle(
                                    color: Colors.green.shade500, fontSize: 12),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
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

const bottomNavBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    backgroundColor: Colors.white,
    label: "Home",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.compass_calibration_outlined),
    backgroundColor: Colors.white,
    label: "Unknown",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.add),
    label: "Create",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.chat_bubble_outline),
    backgroundColor: Colors.white,
    label: "Chats",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.notifications_none),
    backgroundColor: Colors.white,
    label: "Notifications",
  ),
];
