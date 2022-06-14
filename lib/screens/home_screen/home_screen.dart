import 'package:flutter/material.dart';
import 'package:reddit_ui_clone/models/post.dart';
import 'package:reddit_ui_clone/models/trending_post.dart';
import 'package:reddit_ui_clone/screens/chat_screen/chat_screen.dart';
import 'package:reddit_ui_clone/screens/chat_screen/widgets/chat_screen_app_bar.dart';
import 'package:reddit_ui_clone/screens/home_screen/widgets/nav_drawer.dart';
import 'package:reddit_ui_clone/screens/home_screen/widgets/popular_posts_header_container.dart';
import 'package:reddit_ui_clone/screens/notification_screen/notification_screen.dart';
import 'package:reddit_ui_clone/screens/notification_screen/widgets/notification_screen_app_bar.dart';

import 'widgets/home_app_bar.dart';
import 'widgets/home_widget.dart';
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
  int _selectedItemIndex = 0;

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
        const HomeWidget(),
        const Text("Coming Soon"),
        const Text("Coming Soon"),
        const ChatScreen(),
        const NotificationScreen(),
      ].elementAt(_selectedItemIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onBottomNavItemTap,
        currentIndex: _selectedItemIndex,
        items: _bottomBarItems(_selectedItemIndex),
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

  List<BottomNavigationBarItem> _bottomBarItems(int selectedIndex) {
    return [
      BottomNavigationBarItem(
        icon: Icon(
          selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined,
          size: 30,
        ),
        backgroundColor: Colors.white,
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          selectedIndex == 1
              ? Icons.compass_calibration
              : Icons.compass_calibration_outlined,
          size: 30,
        ),
        backgroundColor: Colors.white,
        label: "Unknown",
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.add,
          size: 30,
        ),
        label: "Create",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          selectedIndex == 3 ? Icons.chat_bubble : Icons.chat_bubble_outline,
          size: 30,
        ),
        backgroundColor: Colors.white,
        label: "Chats",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          selectedIndex == 4 ? Icons.notifications : Icons.notifications_none,
          size: 30,
        ),
        backgroundColor: Colors.white,
        label: "Notifications",
      ),
    ];
  }
}
