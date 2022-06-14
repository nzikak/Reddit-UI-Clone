import 'package:flutter/material.dart';
import 'package:reddit_ui_clone/models/notification_model.dart' as not;

class NotificationsTabContainer extends StatelessWidget {
  const NotificationsTabContainer({
    Key? key,
  })  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider(
          color: Colors.white,
          height: 0,
          thickness: 1,
        );
      },
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: not.Notification.notifications.length,
      itemBuilder: (context, index) {
        final notification = not.Notification.notifications[index];
        return ListTile(
          tileColor: const Color(0xFFE5F3FE),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          dense: true,
          // visualDensity: VisualDensity.compact,
          leading: SizedBox(
            height: 40,
            width: 40,
            child: Stack(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage(notification.icon)),
                      borderRadius: BorderRadius.circular(50)),
                ),
                Positioned(
                  top: 16,
                  left: 18,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                        Border.all(color: Colors.grey.withOpacity(0.5)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5.0,
                          )
                        ],
                        shape: BoxShape.circle),
                    child: Icon(
                      notification.notificationType,
                      size: 16,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                )
              ],
            ),
          ),
          title: Row(
            children: [
              Text(
                notification.title,
                style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
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
                notification.time,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: () {},
            visualDensity: VisualDensity.compact,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.more_vert, size: 18),
          ),
          subtitle: Text(notification.description),
        );
      },
    );
  }
}