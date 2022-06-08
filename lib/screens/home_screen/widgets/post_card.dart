import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reddit_ui_clone/models/post.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.black.withAlpha(100),
                  width: 0.3))),
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Image.asset(
                    post.subRedditIcon,
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              "r/${post.subReddit}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  "u/${post.authorUsername}",
                                  style: const TextStyle(
                                      color: Colors.grey),
                                ),
                                const SizedBox(width: 2),
                                const Text(
                                  "•",
                                  style: TextStyle(
                                      color: Colors.grey),
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  "${DateFormat.H().format(post.timeStamp)}h",
                                  style: const TextStyle(
                                      color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          iconSize: 20,
                          visualDensity: VisualDensity.compact,
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                post.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            post.imageUrl != null
                ? Image.network(
              post.imageUrl!,
              fit: BoxFit.cover,
            )
                : const SizedBox.shrink(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_upward,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      post.upvotes.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      post.comments.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.share,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Share",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.card_giftcard,
                    color: Colors.black.withOpacity(0.5),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}