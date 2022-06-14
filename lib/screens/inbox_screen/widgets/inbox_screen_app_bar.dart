import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InboxAppBar extends StatelessWidget with PreferredSizeWidget {
  const InboxAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      elevation: 0.0,
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: const Text(
        "Inbox",
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
