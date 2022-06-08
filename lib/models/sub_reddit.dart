class SubReddit {
  final String icon;
  final String name;
  final bool isFavorite;

  SubReddit({
    required this.icon,
    required this.name,
    this.isFavorite = false
  });



  static List<SubReddit> subReddits = [
    SubReddit(icon: "assets/android.png", name: "androiddev"),
    SubReddit(icon: "assets/flutter.png", name: "FlutterDev"),
    SubReddit(icon: "assets/news.png", name: "News"),
  ];

  static List<SubReddit> communities = [
    SubReddit(icon: "assets/android.png", name: "androiddev"),
    SubReddit(icon: "assets/flutter.png", name: "FlutterDev", isFavorite: true),
    SubReddit(icon: "assets/news.png", name: "News"),
    SubReddit(icon: "assets/firebase.png", name: "Firebase"),
    SubReddit(icon: "assets/reddit.png", name: "announcements"),
  ];
}
