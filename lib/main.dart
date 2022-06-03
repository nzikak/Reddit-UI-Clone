import 'package:flutter/material.dart';
import 'package:reddit_ui_clone/config/app_router.dart';
import 'package:reddit_ui_clone/config/theme.dart';
import 'package:reddit_ui_clone/screens/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      onGenerateRoute: AppRoute.onGenerate,
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
      title: "Reddit",
      theme: theme(),
    ),
  );
}
