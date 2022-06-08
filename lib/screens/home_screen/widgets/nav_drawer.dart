import 'package:flutter/material.dart';
import 'package:reddit_ui_clone/models/sub_reddit.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Recently Visited",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("See all")
              ],
            ),
          ),
          Column(
            children: SubReddit.subReddits.map((subReddit) {
              return ListTile(
                leading: Image.asset(
                  subReddit.icon,
                  width: 20,
                  height: 20,
                ),
                visualDensity: VisualDensity.compact,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                minLeadingWidth: 2,
                title: Text(
                  "r/${subReddit.name}",
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Favorites",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.keyboard_arrow_down_sharp)
              ],
            ),
          ),
          ListTile(
            leading: Image.asset(
              "assets/flutter.png",
              width: 20,
              height: 20,
            ),
            minLeadingWidth: 2,
            title: const Text(
              "FlutterDev",
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            visualDensity: VisualDensity.compact,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            trailing: IconButton(
              onPressed: () {},
              iconSize: 20,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(Icons.star),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Your Communities",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.keyboard_arrow_down_sharp)
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add),
            minLeadingWidth: 2,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            visualDensity: VisualDensity.compact,
            title: const Text(
              "Create a community",
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Column(
            children: SubReddit.communities.map((subReddit) {
              return ListTile(
                leading: Image.asset(
                  subReddit.icon,
                  width: 20,
                  height: 20,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                minLeadingWidth: 2,
                title: Text(
                  "r/${subReddit.name}",
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
                visualDensity: VisualDensity.compact,
                trailing: IconButton(
                  onPressed: () {},
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: subReddit.isFavorite
                      ? const Icon(Icons.star)
                      : const Icon(Icons.star_border_outlined),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
          ListTile(
            leading: const Icon(
              Icons.feed_outlined,
              size: 20,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            minLeadingWidth: 2,
            title: const Text(
              "Custom Feeds",
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            visualDensity: VisualDensity.compact,
            trailing: IconButton(
              onPressed: () {},
              iconSize: 20,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(Icons.star_border_outlined),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.bar_chart,
              size: 20,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            minLeadingWidth: 2,
            title: const Text(
              "All",
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            visualDensity: VisualDensity.compact,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
