import 'package:flutter/material.dart';
import 'package:reddit_ui_clone/models/message_model.dart';

class MessagesTabContainer extends StatelessWidget {
  const MessagesTabContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Message.messages.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final message = Message.messages[index];
        return Container(
          color: Colors.white.withOpacity(0.8),
          padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.mail,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message.content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "u/${message.username}",
                        style: const TextStyle(
                          color: Colors.redAccent,
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        "•",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        "${message.timeSent}h",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ],
                  )
                ],
              ))
            ],
          ),
        );
      },
    );
  }
}
