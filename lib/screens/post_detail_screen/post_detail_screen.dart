import 'package:flutter/material.dart';
import 'package:reddit_ui_clone/models/post.dart';
import 'package:reddit_ui_clone/screens/post_detail_screen/widgets/post_detail_app_bar.dart';
import 'widgets/comment_box_container.dart';
import 'widgets/comments_header_container.dart';
import 'widgets/post_comments_list_view.dart';
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
        body: const PostCommentsListView(),
      ),
      bottomNavigationBar: CommentBoxContainer(controller: _controller),
    );
  }
}








