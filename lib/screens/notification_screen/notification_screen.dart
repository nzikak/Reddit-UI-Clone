import 'package:flutter/material.dart';
import 'widgets/messages_tab_container.dart';
import 'widgets/notifications_tab_container.dart';

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
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 2.0,
                        offset: const Offset(1.0, 1.0),
                      )
                    ]),
                child: SizedBox(
                  width: 250,
                  child: TabBar(
                      controller: _controller,
                      indicatorColor: Theme.of(context).colorScheme.secondary,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey.shade600,
                      tabs: const [
                        Tab(text: "Notifications"),
                        Tab(text: "Messages")
                      ]),
                ),
              ),
            )
          ];
        },
        body: TabBarView(
          controller: _controller,
          children: const [
            NotificationsTabContainer(),
            MessagesTabContainer()
          ],
        ));
  }
}
