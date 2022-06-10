import 'package:flutter/material.dart';
import 'package:reddit_ui_clone/models/comment.dart';

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
                      const SizedBox(width: 6),
                      SizedBox(
                        width: 25,
                        child: Text(
                          threadComment.upvotes.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 6),
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
              )
            ]),
          );
        });
  }
}
