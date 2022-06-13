import 'package:flutter/material.dart';

class Notification {
  final String title;
  final String description;
  final String time;
  final String icon;
  final IconData notificationType;

  Notification({
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
    required this.notificationType,
  });

  static List<Notification> notifications = [
    Notification(
      title: "Popular on r/FlutterDev",
      description: "Flutter or ReactNative?",
      time: "4h",
      icon: "assets/flutter.png",
      notificationType: Icons.notifications_active,
    ),
    Notification(
      title: "Lorem ipsum",
      description: "Vivamus sodales nibh nulla",
      time: "30m",
      icon: "assets/news.png",
      notificationType: Icons.trending_up,
    ),
  ];
}
