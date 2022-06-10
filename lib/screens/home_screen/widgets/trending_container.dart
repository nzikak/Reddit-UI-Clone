import 'package:flutter/material.dart';
import 'package:reddit_ui_clone/models/trending_post.dart';

class TrendingContainer extends StatelessWidget {
  const TrendingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.trending_up,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Trending today",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 90,
              child: ListView.builder(
                itemCount: TrendingPost.trendingPosts.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final post = TrendingPost.trendingPosts[index];
                  return Container(
                    width: 150,
                    height: 90,
                    margin: const EdgeInsets.only(right: 8.0),
                    child: Stack(
                      children: [
                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(post.imageUrl),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: const LinearGradient(
                              colors: [Colors.black, Colors.transparent],
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              post.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}