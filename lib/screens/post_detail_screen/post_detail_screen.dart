import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reddit_ui_clone/models/post.dart';
import 'package:reddit_ui_clone/screens/post_detail_screen/widgets/post_detail_app_bar.dart';

class PostDetail extends StatelessWidget {
  static const String routeName = "/post-detail";
  final Post post;

  const PostDetail({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PostDetailAppBar(post: post),
    );
  }
}




