import 'package:flutter/material.dart';

class HomePostHeaderContainer extends StatelessWidget {
  const HomePostHeaderContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.rocket_outlined,
                      size: 20,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withAlpha(150),
                    ),
                    const SizedBox(width: 2),
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
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  Icons.table_rows_outlined,
                  color:
                      Theme.of(context).colorScheme.onBackground.withAlpha(150),
                ),
              )
            ],
          ),
        ),
        const Divider(
          height: 0,
        )
      ],
    );
  }
}
