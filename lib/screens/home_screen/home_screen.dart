import 'package:flutter/material.dart';
import 'package:reddit_ui_clone/models/post.dart';
import 'package:reddit_ui_clone/models/trending_post.dart';
import 'package:reddit_ui_clone/screens/chat_screen/widgets/chat_screen_app_bar.dart';
import 'package:reddit_ui_clone/screens/home_screen/widgets/nav_drawer.dart';
import 'package:reddit_ui_clone/screens/home_screen/widgets/popular_posts_header_container.dart';
import 'package:reddit_ui_clone/screens/notification_screen/notification_screen.dart';
import 'package:reddit_ui_clone/screens/notification_screen/widgets/notification_screen_app_bar.dart';

import 'widgets/home_app_bar.dart';
import 'widgets/post_card.dart';
import 'widgets/home_posts_header_container.dart';
import 'widgets/profile_drawer.dart';
import 'widgets/trending_container.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  int _selectedItemIndex = 0;


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
      appBar: [
        const HomeAppBar(),
        const HomeAppBar(),
        const HomeAppBar(), 
        const ChatScreenAppBar(),
        const NotificationAppBar()
      ].elementAt(_selectedItemIndex) as PreferredSizeWidget?,
      endDrawer: const ProfileDrawer(),
      body: [
        HomeWidget(tabController: _tabController),
        const Text("Coming Soon"),
        const Text("Coming Soon"),
        const Text("Coming Soon"),
        const NotificationScreen(),
      ].elementAt(_selectedItemIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onBottomNavItemTap,
        currentIndex: _selectedItemIndex,
        items: bottomNavBarItems,
        unselectedItemColor:
            Theme.of(context).colorScheme.onSurface.withAlpha(150),
        selectedItemColor: Theme.of(context).colorScheme.onSurface,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  void _onBottomNavItemTap(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
    required TabController tabController,
  }) : _tabController = tabController, super(key: key);

  final TabController _tabController;

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
