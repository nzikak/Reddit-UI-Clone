class Message {
  final String title;
  final String content;
  final String username;
  final int timeSent;

  Message({
    required this.title,
    required this.content,
    required this.username,
    required this.timeSent,
  });

  static List<Message> messages = [
    Message(
      title: "Lorem ipsum dolor sit amet",
      content:
          "Praesent non metus non odio dictum pretium. Ut pellentesque dapibus ornare. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec tincidunt purus eget nisl pellentesque molestie. Integer nulla purus, convallis quis congue eget, aliquam in ante. Aliquam egestas lectus sit amet malesuada aliquam. Pellentesque porta convallis aliquet. Suspendisse nec sagittis turpis. Phasellus quam orci, vehicula sit amet laoreet sed, tempus ut lacus. Cras luctus lectus aliquam maximus sollicitudin",
      username: "skyWalker",
      timeSent: 2,
    ),
    Message(
      title:
          "Donec rhoncus fermentum facilisis. Donec tempor magna quis justo gravida euismod",
      content:
          "Aenean vel felis ante. Vestibulum purus enim, pharetra ac cursus eu, dictum sit amet arcu. Aliquam luctus convallis lorem, sed ornare ex efficitur id. Duis iaculis facilisis elementum. Ut sit amet aliquet enim. Praesent nibh tellus, ullamcorper tempus venenatis id, eleifend non arcu. Integer at pretium mauris. Sed vestibulum eros eros. Duis dictum diam nibh, a placerat sem feugiat id. Nulla id porta justo.",
      username: "anakin",
      timeSent: 4,
    ),
  ];
}
