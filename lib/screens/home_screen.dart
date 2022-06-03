import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        backgroundColor: Theme.of(context).colorScheme.primary,
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
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
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
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const Text("Tab one"),
                const Text("Tab two"),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavBarItems,
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
