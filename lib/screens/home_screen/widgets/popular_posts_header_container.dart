import 'package:flutter/material.dart';

class PopularPostsHeaderContainer extends StatelessWidget {
  const PopularPostsHeaderContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {

                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.local_fire_department_sharp,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withAlpha(150),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          "HOT POSTS",
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
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {

                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 20.0,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withAlpha(150),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          "GLOBAL",
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withAlpha(150),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  Icons.table_rows_outlined,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withAlpha(150),
                ),
              )
            ],
          ),
        ),
        const Divider(height: 0,)
      ],
    );
  }
}