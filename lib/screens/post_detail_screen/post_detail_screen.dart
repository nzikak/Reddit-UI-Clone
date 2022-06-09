import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reddit_ui_clone/models/comment.dart';
import 'package:reddit_ui_clone/models/post.dart';
import 'package:reddit_ui_clone/screens/post_detail_screen/widgets/post_detail_app_bar.dart';

import 'widgets/post_description_container.dart';

class PostDetail extends StatelessWidget {
  static const String routeName = "/post-detail";
  final Post post;
  final ScrollController _controller = ScrollController();

  PostDetail({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PostDetailAppBar(post: post),
      body: NestedScrollView(
        controller: _controller,
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: PostDescriptionContainer(post: post),
            ),
            const SliverToBoxAdapter(
              child: CommentsHeaderContainer(),
            ),
          ];
        },
        body: ListView.builder(
            itemCount: Comment.comments.length,
            physics: const BouncingScrollPhysics(),
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
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Icon(Icons.person)),
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
                              Icon(
                                Icons.arrow_upward_outlined,
                                size: 18,
                                color: Colors.black.withOpacity(0.6),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                comment.upvotes.toString(),
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 4),
                              Icon(
                                Icons.arrow_downward_outlined,
                                size: 18,
                                color: Colors.black.withOpacity(0.6),
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
                                color: Colors.grey.withOpacity(0.5),
                                width: 0.5),
                          )),
                          child: ThreadCommentContainer(comment: comment))
                    ],
                  ),
                ),
              );
            }),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Add a comment",
                    filled: true,
                    border: InputBorder.none,
                    fillColor:
                        Theme.of(context).colorScheme.background.withAlpha(100),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Material(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).colorScheme.background.withAlpha(100),
              child: IconButton(
                onPressed: () {
                  _controller.jumpTo(_controller.position.maxScrollExtent);
                },
                icon: const Icon(Icons.keyboard_double_arrow_down),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ThreadCommentContainer extends StatelessWidget {
  const ThreadCommentContainer({
    Key? key,
    required this.comment,
  }) : super(key: key);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: comment.thread.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final threadComment = comment.thread[index];
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(children: [
              Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(Icons.person)),
                  const SizedBox(width: 4),
                  Text(
                    threadComment.userName,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "${threadComment.timePosted}h",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(threadComment.description),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    iconSize: 18.0,
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {},
                    iconSize: 18.0,
                    icon: Icon(
                      Icons.card_giftcard,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {},
                    iconSize: 18,
                    icon: Icon(
                      Icons.reply_outlined,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_upward_outlined,
                        size: 18,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        threadComment.upvotes.toString(),
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_downward_outlined,
                        size: 18,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ],
                  ),
                ],
              )
            ]),
          );
        });
  }
}

class CommentsHeaderContainer extends StatelessWidget {
  const CommentsHeaderContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.rocket_outlined,
              size: 20,
              color: Theme.of(context).colorScheme.onBackground.withAlpha(150),
            ),
            const SizedBox(width: 2),
            Text(
              "BEST POSTS",
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 4.0),
            Icon(
              Icons.keyboard_arrow_down,
              size: 16,
              color: Theme.of(context).colorScheme.onBackground.withAlpha(150),
            ),
          ],
        ),
      ),
    );
  }
}
