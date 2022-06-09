import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reddit_ui_clone/models/post.dart';

const String _postDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean molestie erat nec condimentum pulvinar. Integer imperdiet mauris turpis, at dignissim nisl mattis congue. Vivamus sodales nibh nulla, ut tincidunt mauris sagittis at. Sed neque ipsum, accumsan nec auctor nec, feugiat non massa. Etiam quis ligula eget tortor pellentesque accumsan ac a eros. Quisque ullamcorper dui ex, id fermentum nulla egestas non. Cras ullamcorper dictum massa, et dictum magna ultricies eget.";

class PostDescriptionContainer extends StatelessWidget {
  final Post post;

  const PostDescriptionContainer({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  post.subRedditIcon,
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 5),
                Row(
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
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            Text(
              post.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 24),
            const Text(_postDescription),
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
                      Icons.share_outlined,
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
