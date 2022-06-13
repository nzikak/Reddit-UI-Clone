import 'package:flutter/material.dart';
import 'package:reddit_ui_clone/models/notification_model.dart' as Not;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with TickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, value) {
        return [
          SliverToBoxAdapter(
            child: Row(
              children: [
                TabBar(controller: _controller, tabs: const [
                  Tab(text: "Notifications"),
                  Tab(text: "Messages")
                ])
              ],
            ),
          )
        ];
      },
      body: TabBarView(children: [
        ListView.builder(
          itemCount: Not.Notification.notifications.length,
          itemBuilder: (context, index) {
            final notification = Not.Notification.notifications[index];
            return ListTile(
              leading: SizedBox(
                height: 40,
                width: 40,
                child: Stack(
                  children: [
                    Image.asset(
                      notification.icon,
                      width: 25,
                      height: 25,
                    ),
                    Positioned(
                      top: 20,
                      child: Icon(
                        notification.notificationType,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    )
                  ],
                ),
              ),
              title: Row(
                children: [
                  Text(
                    notification.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal
                    ),
                  ),
                  const SizedBox(width: 3),
                  Text("•"),
                  const SizedBox(width: 3),
                  Text(notification.time),
                ],
              ),
              trailing: Icon(Icons.more_vert),
              subtitle: Text(notification.description),
            );
          },
        )
      ]),
    );
  }
}
