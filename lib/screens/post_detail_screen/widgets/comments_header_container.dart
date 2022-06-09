import 'package:flutter/material.dart';


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