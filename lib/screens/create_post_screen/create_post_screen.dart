import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class CreatePostScreen extends StatefulWidget {
  static const routeName = "create-post";

  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  late final TextEditingController _controller;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          iconSize: 30,
          icon: const Icon(Icons.close),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: ElevatedButton(
              onPressed: _isButtonEnabled ? () {} : null,
              style: ElevatedButton.styleFrom(
                primary: _isButtonEnabled
                    ? Theme.of(context).colorScheme.secondary
                    : Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 0.0,
              ),
              child: Text(
                "Next",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _isButtonEnabled ? Colors.white : Colors.grey),
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _controller,
                onChanged: (value) {
                  setState(() {
                    _isButtonEnabled = _controller.text.isNotEmpty;
                  });
                },
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                cursorColor: Theme.of(context).colorScheme.secondary,
                cursorHeight: 30,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "An Interesting title",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.4),
                        letterSpacing: 1,
                        fontSize: 20)),
              ),
            )
          ],
        ),
      ),
      bottomSheet:
          KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
        return isKeyboardVisible ? _collapsedBottomSheet() : _fullBottomSheet();
      }),
    );
  }

  Widget _collapsedBottomSheet() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10.0,
            offset: const Offset(0, 2.0),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Row(
          children: [
            Icon(
              Icons.image_outlined,
              color: Colors.black.withOpacity(0.7),
              size: 28,
            ),
            const SizedBox(width: 20),
            Icon(
              Icons.play_circle_outline,
              color: Colors.black.withOpacity(0.7),
              size: 28,
            ),
            const SizedBox(width: 20),
            Icon(
              Icons.sticky_note_2_outlined,
              color: Colors.black.withOpacity(0.7),
              size: 28,
            ),
            const SizedBox(width: 20),
            Icon(
              Icons.link,
              color: Colors.black.withOpacity(0.7),
              size: 28,
            ),
            const SizedBox(width: 20),
            Icon(
              Icons.poll_outlined,
              color: Colors.black.withOpacity(0.7),
              size: 28,
            ),
          ],
        ),
      ),
    );
  }

  Widget _fullBottomSheet() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10.0,
            offset: const Offset(0, 2.0),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          ListTile(
            leading: Icon(
              Icons.image_outlined,
              color: Colors.black,
            ),
            contentPadding: EdgeInsets.only(left: 10, top: 0),
            dense: true,
            horizontalTitleGap: 2,
            title: Text(
              "Image",
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.play_circle_outline,
              color: Colors.black,
            ),
            dense: true,
            contentPadding: EdgeInsets.only(left: 10, top: 0),
            horizontalTitleGap: 2,
            title: Text(
              "Video",
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.sticky_note_2_outlined,
              color: Colors.black,
            ),
            dense: true,
            contentPadding: EdgeInsets.only(left: 10, top: 0),
            horizontalTitleGap: 2,
            title: Text(
              "Text",
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.link,
              color: Colors.black,
            ),
            dense: true,
            contentPadding: EdgeInsets.only(left: 10, top: 0),
            horizontalTitleGap: 2,
            title: Text(
              "Link",
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.poll_outlined,
              color: Colors.black,
            ),
            dense: true,
            contentPadding: EdgeInsets.only(left: 10, top: 0),
            horizontalTitleGap: 2,
            title: Text(
              "Poll",
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
