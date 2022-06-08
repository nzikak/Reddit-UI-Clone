import 'package:flutter/material.dart';
import 'package:reddit_ui_clone/screens/home_screen/home_screen.dart';

class AppRoute {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );
      default:
        return _errorRoute();
    }
  }


  static Route _errorRoute() {
    return MaterialPageRoute(builder: (context) =>
        Scaffold(appBar: AppBar(title: const Text("Error"),),),);
  }
}
