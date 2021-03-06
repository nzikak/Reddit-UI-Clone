import 'package:flutter/material.dart';
import 'package:reddit_ui_clone/screens/chat_screen/chat_screen.dart';
import 'package:reddit_ui_clone/screens/chat_screen/widgets/chat_screen_app_bar.dart';
import 'package:reddit_ui_clone/screens/create_post_screen/create_post_screen.dart';
import 'package:reddit_ui_clone/screens/home_screen/widgets/nav_drawer.dart';
import 'package:reddit_ui_clone/screens/inbox_screen/inbox_screen.dart';
import 'package:reddit_ui_clone/screens/inbox_screen/widgets/inbox_screen_app_bar.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_widget.dart';
import 'widgets/profile_drawer.dart';

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
        const InboxAppBar()
      ].elementAt(_selectedItemIndex) as PreferredSizeWidget?,
      endDrawer: const ProfileDrawer(),
      body: [
        const HomeWidget(),
        const Text("Coming Soon"),
        const Text("Coming Soon"),
        const ChatScreen(),
        const InboxScreen(),
      ].elementAt(_selectedItemIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _onBottomNavItemTap(index, context);
        },
        type: BottomNavigationBarType.fixed,
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

  void _onBottomNavItemTap(int index, BuildContext context) {
    if (index == 2) {
      Navigator.of(context).pushNamed(CreatePostScreen.routeName);
    } else {
      setState(() {
        _selectedItemIndex = index;
      });
    }
  }

  List<BottomNavigationBarItem> _bottomBarItems(int selectedIndex) {
    return [
      BottomNavigationBarItem(
        icon: Icon(
          selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined,
          size: 24,
        ),
        backgroundColor: Colors.white,
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          selectedIndex == 1
              ? Icons.compass_calibration
              : Icons.compass_calibration_outlined,
          size: 24,
        ),
        backgroundColor: Colors.white,
        label: "Unknown",
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.add,
          size: 24,
        ),
        label: "Create",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          selectedIndex == 3 ? Icons.chat_bubble : Icons.chat_bubble_outline,
          size: 24,
        ),
        backgroundColor: Colors.white,
        label: "Chats",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          selectedIndex == 4 ? Icons.notifications : Icons.notifications_none,
          size: 24,
        ),
        backgroundColor: Colors.white,
        label: "Notifications",
      ),
    ];
  }
}
