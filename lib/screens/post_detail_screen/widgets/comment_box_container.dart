import 'package:flutter/material.dart';

class CommentBoxContainer extends StatelessWidget {
  const CommentBoxContainer({
    Key? key,
    required ScrollController controller,
  }) : _controller = controller, super(key: key);

  final ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}