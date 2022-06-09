import 'dart:core';

class Comment {
  final String userName;
  final int timePosted;
  final String description;
  final int upvotes;
  final List<Comment> thread;

  Comment({
    required this.userName,
    required this.timePosted,
    required this.description,
    required this.upvotes,
    this.thread = const [],
  });

  static List<Comment> comments = [
    Comment(
      userName: "darthVader",
      timePosted: 8,
      description:
          "Praesent non metus non odio dictum pretium. Ut pellentesque dapibus ornare. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae",
      upvotes: 56,
    ),
    Comment(
        userName: "c3PO",
        timePosted: 8,
        description:
            "Praesent non metus non odio dictum pretium. Ut pellentesque dapibus ornare. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae",
        upvotes: 56,
        thread: [
          Comment(
            userName: "R2D2",
            timePosted: 5,
            description:
                "Donec tincidunt purus eget nisl pellentesque molestie.",
            upvotes: 12,
          ),
        ]),
    Comment(
      userName: "Palpatine",
      timePosted: 8,
      description:
          "Praesent non metus non odio dictum pretium. Ut pellentesque dapibus ornare. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae",
      upvotes: 72,
    ),
    Comment(
      userName: "DrStrange",
      timePosted: 14,
      description:
          "Praesent non metus non odio dictum pretium. Ut pellentesque dapibus ornare. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae",
      upvotes: 700,
      thread:  [
        Comment(
          userName: "Wanda",
          timePosted: 4,
          description:
          "Donec tincidunt purus eget nisl pellentesque molestie.",
          upvotes: 12,
        ),
        Comment(
          userName: "Billy",
          timePosted: 3,
          description:
          "Donec tincidunt purus eget nisl pellentesque molestie.",
          upvotes: 8,
        ),
        Comment(
          userName: "Tommy",
          timePosted: 2,
          description:
          "Donec tincidunt purus eget nisl pellentesque molestie.",
          upvotes: 14,
        ),
      ]
    ),
    Comment(
      userName: "eleven",
      timePosted: 6,
      description:
          "Praesent non metus non odio dictum pretium. Ut pellentesque dapibus ornare. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae",
      upvotes: 99,
    ),
  ];
}
