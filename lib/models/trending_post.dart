class TrendingPost {
  final String imageUrl;
  final String title;

  TrendingPost({
    required this.imageUrl,
    required this.title,
  });

  static List<TrendingPost> trendingPosts = [
    TrendingPost(
      imageUrl:
          "https://images.unsplash.com/photo-1632505084035-6430e808becc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
      title: "IOS 16",
    ),
    TrendingPost(
      imageUrl:
          "https://images.unsplash.com/photo-1588431558645-316675e000de?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
      title: "UCL Final",
    ),
    TrendingPost(
      imageUrl:
          "https://images.unsplash.com/photo-1562527372-00a214490a28?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1031&q=80",
      title: "Stranger Things",
    ),
    TrendingPost(
      imageUrl:
          "https://images.unsplash.com/photo-1605792657660-596af9009e82?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=802&q=80",
      title: "Bitcoin",
    ),
  ];
}
