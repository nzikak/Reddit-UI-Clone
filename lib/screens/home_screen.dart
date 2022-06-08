import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reddit_ui_clone/models/post.dart';

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
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0.0,
        title: SizedBox(
          height: 32,
          child: TextField(
            cursorColor: Colors.black,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: "Search",
              fillColor:
                  Theme.of(context).colorScheme.background.withAlpha(100),
              filled: true,
              contentPadding:
                  const EdgeInsets.only(top: 5, bottom: 5, left: 10),
              isDense: true,
              prefixIcon: const Icon(Icons.search),
              border: InputBorder.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
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
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.rocket_outlined,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withAlpha(150),
                        ),
                        Text(
                          "BEST POSTS",
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withAlpha(150),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withAlpha(150),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.table_rows_outlined,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withAlpha(150),
                    ),
                  )
                ],
              ),
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
                  return Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.black.withAlpha(100),
                                width: 0.3))),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            post.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        post.imageUrl != null
                            ? Image.network(
                          post.imageUrl!,
                          fit: BoxFit.cover,
                        )
                            : const SizedBox.shrink(),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon:
                                  const Icon(Icons.arrow_upward),
                                ),
                                Text(
                                  post.upvotes.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.arrow_downward),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.chat_bubble_outline,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.8),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  post.comments.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.share,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.8),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "Share",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.card_giftcard,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.8),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }),
            const Text("Tab three"),
          ],
        )
      ),
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
