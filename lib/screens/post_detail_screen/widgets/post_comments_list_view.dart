import 'package:flutter/material.dart';
import 'package:reddit_ui_clone/models/comment.dart';

import 'thread_comments_list_view.dart';

class PostCommentsListView extends StatelessWidget {
  const PostCommentsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlow(),
      child: ListView.builder(
          itemCount: Comment.comments.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final comment = Comment.comments[index];
            return Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Material(
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(50)),
                          child: const Icon(Icons.person),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          comment.userName,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${comment.timePosted}h",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(comment.description),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          iconSize: 18,
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(width: 20),
                        IconButton(
                          onPressed: () {},
                          iconSize: 18,
                          icon: Icon(
                            Icons.card_giftcard,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.reply_outlined,
                              size: 18,
                              color: Colors.black.withOpacity(0.6),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "Reply",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const SizedBox(width: 20),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              icon: Icon(
                                Icons.arrow_upward_outlined,
                                size: 18,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                            const SizedBox(width: 4),
                            SizedBox(
                              width: 25,
                              child: Text(
                                comment.upvotes.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: 4),
                            IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              icon: Icon(
                                Icons.arrow_downward_outlined,
                                size: 18,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 10.0),
                        decoration: BoxDecoration(
                            border: Border(
                          left: BorderSide(
                              color: Colors.grey.withOpacity(0.5), width: 0.5),
                        )),
                        child: ThreadCommentContainer(comment: comment))
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class NoGlow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
