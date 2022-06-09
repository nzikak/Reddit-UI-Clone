import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reddit_ui_clone/models/post.dart';

class PostDetailAppBar extends StatelessWidget with PreferredSizeWidget{
  const PostDetailAppBar({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      systemOverlayStyle:  SystemUiOverlayStyle(
          statusBarColor: post.subRedditColor,
          statusBarIconBrightness: Brightness.light),
      backgroundColor: post.subRedditColor,
      iconTheme: const IconThemeData(color: Colors.white),
      actionsIconTheme: const IconThemeData(color: Colors.white),
      leadingWidth: 30,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
      title: Text("r/${post.subReddit}"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none),
        ),
        PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                padding: const EdgeInsets.only(left: 16, right: 20),
                child:
                _getPopupItem(Icons.bookmark_outline_sharp, "Save"),
              ),
              PopupMenuItem(
                padding: const EdgeInsets.only(left: 16, right: 20),
                child: _getPopupItem(Icons.hide_source, "Hide post"),
              ),
              PopupMenuItem(
                padding: const EdgeInsets.only(left: 16, right: 20),
                child: _getPopupItem(Icons.flag_outlined, "Report"),
              ),
              PopupMenuItem(
                padding: const EdgeInsets.only(left: 16, right: 20),
                child: _getPopupItem(Icons.block, "Block account"),
              ),
            ]),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

Widget _getPopupItem(IconData icon, String title) {
  return Row(
    children: [
      Icon(
        icon,
        color: Colors.black,
      ),
      const SizedBox(width: 8.0),
      Text(title),

    ],
  );
}