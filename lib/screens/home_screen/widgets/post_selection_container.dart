import 'package:flutter/material.dart';

class PostSelectionContainer extends StatelessWidget {
  const PostSelectionContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.rocket_outlined,
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withAlpha(150),
              ),
              Text(
                "BEST POSTS",
                style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withAlpha(150),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 5.0),
              Icon(
                Icons.keyboard_arrow_down,
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withAlpha(150),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.table_rows_outlined,
            color: Theme.of(context)
                .colorScheme
                .onBackground
                .withAlpha(150),
          ),
        )
      ],
    );
  }
}