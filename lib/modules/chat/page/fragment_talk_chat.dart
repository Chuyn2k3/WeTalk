import 'package:flutter/material.dart';
import 'fragment_talk_chat_home.dart';
final GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();


class ChatMainScreen extends StatefulWidget {
  @override
  _ChatMainScreenState createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tin nhắn"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button press
            },
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('User $index'),
                    subtitle: Text('Last message $index'),
                    onTap: () {
                      openChatScreen(context);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
void openChatScreen(BuildContext context) {
  Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
    builder: (context) => ChatScreen(),
  ));
}


