import 'package:flutter/material.dart';
import 'package:reddit_ui_clone/models/post.dart';
import 'package:reddit_ui_clone/screens/create_post_screen/create_post_screen.dart';
import 'package:reddit_ui_clone/screens/home_screen/home_screen.dart';
import 'package:reddit_ui_clone/screens/post_detail_screen/post_detail_screen.dart';

class AppRoute {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );
      case PostDetail.routeName:
        final post = settings.arguments as Post;
        return MaterialPageRoute(
          builder: (context) => PostDetail(post: post),
          settings: settings,
        );
      case CreatePostScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const CreatePostScreen(),
          settings: settings,
        );
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
      ),
    );
  }
}
