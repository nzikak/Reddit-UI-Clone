import 'package:flutter/material.dart';
import 'package:reddit_ui_clone/models/post.dart';

import 'widgets/home_app_bar.dart';
import 'widgets/post_card.dart';
import 'widgets/post_selection_container.dart';

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
      drawer: const Drawer(),
      appBar: const HomeAppBar(),
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
              const SliverToBoxAdapter(
                child: PostSelectionContainer(),
              )
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: Post.posts.length,
                  itemBuilder: (context, index) {
                    final post = Post.posts[index];
                    return PostCard(post: post);
                  }),
              const Text("Tab three"),
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







const bottomNavBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    label: "Home",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.compass_calibration_outlined),
    label: "Unknown",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.add),
    label: "Create",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.chat_bubble_outline),
    label: "Chats",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.notifications_none),
    label: "Notifications",
  ),
];
