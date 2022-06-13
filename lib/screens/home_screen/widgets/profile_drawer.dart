import 'package:flutter/material.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 200,
                    margin: const EdgeInsets.only(left: 16, right: 16, top: 62),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/kenobi.png",
                          height: 170,
                          fit: BoxFit.cover,
                          width: 180,
                        ),
                        const SizedBox(height: 4),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "u/obiWan-kenobi",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.keyboard_arrow_down_sharp)
                            ],
                          ),
                        ),
                        OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.green.shade500),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                visualDensity: VisualDensity.compact),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 16,
                                    color: Colors.green.shade500,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "Online Status: On",
                                    style: TextStyle(
                                        color: Colors.green.shade500,
                                        fontSize: 12),
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(colors: [
                        Colors.red.shade700,
                        Colors.orange.shade700
                      ])),
                  child: Row(
                    children: const [
                      Expanded(
                          child: Text(
                            "Create Avatar",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          )),
                      Icon(Icons.keyboard_arrow_right, color: Colors.white),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16, top: 16, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Icon(
                            Icons.ac_unit,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "172",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "Karma",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                      child: VerticalDivider(),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.contact_mail,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "5y 60d",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  "Reddit age",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(),
              ),
              const SizedBox(height: 8),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.grey.shade600,
                ),
                dense: true,
                visualDensity: VisualDensity.compact,
                horizontalTitleGap: 4,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                title: const Text(
                  "My profile",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.album_outlined,
                  color: Colors.grey.shade600,
                ),
                dense: true,
                visualDensity: VisualDensity.compact,
                horizontalTitleGap: 4,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                title: const Text(
                  "Create a community",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.monetization_on_outlined,
                  color: Colors.grey.shade600,
                ),
                dense: true,
                visualDensity: VisualDensity.compact,
                horizontalTitleGap: 4,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                title: const Text(
                  "Reddit Coins",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("5000 Coins"),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.shield_outlined,
                  color: Colors.grey.shade600,
                ),
                dense: true,
                visualDensity: VisualDensity.compact,
                horizontalTitleGap: 4,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                title: const Text(
                  "Reddit Premium",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Ads-free browsing"),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.bookmarks_outlined,
                  color: Colors.grey.shade600,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                dense: true,
                visualDensity: VisualDensity.compact,
                horizontalTitleGap: 4,
                title: const Text(
                  "Saved",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.history_toggle_off_outlined,
                  color: Colors.grey.shade600,
                ),
                horizontalTitleGap: 4,
                dense: true,
                visualDensity: VisualDensity.compact,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                title: const Text(
                  "History",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.settings,
                  color: Colors.grey.shade600,
                ),
                dense: true,
                horizontalTitleGap: 4,
                visualDensity: VisualDensity.compact,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                title: const Text(
                  "Settings",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}