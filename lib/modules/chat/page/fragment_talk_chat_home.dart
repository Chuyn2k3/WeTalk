import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: kToolbarHeight + 29.0,
            margin: EdgeInsets.only(top: 24.0),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {},
              ),
              title: Row(
                children: [
                  ProfilePicView(),
                  SizedBox(width: 10.0),
                  Text(
                    "Username",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.videocam),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: MessageListView(messages: _messages),
          ),
          Container(
            height: 80.0,
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Write message here',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.sentiment_satisfied),
                  onPressed: () {
                    _showStickerDialog(context);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.send, size: 30.0, color: Colors.blue),
                  onPressed: () {
                    _sendMessage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    String message = _messageController.text;
    if (message.isNotEmpty) {
      setState(() {
        _messages.add(message);
        _messageController.clear();
      });
    }
  }

  void _showStickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose a Sticker'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStickerButton('😊'),
                  _buildStickerButton('😂'),
                  _buildStickerButton('😍'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStickerButton('🥰'),
                  _buildStickerButton('😎'),
                  _buildStickerButton('🤩'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStickerButton(String sticker) {
    return TextButton(
      onPressed: () {
        _addStickerToMessage(sticker);
        Navigator.pop(context);
      },
      child: Text(sticker),
    );
  }

  void _addStickerToMessage(String sticker) {
    setState(() {
      _messages.add(sticker);
    });
  }
}

class ProfilePicView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.0,
      height: 48.0,
      margin: EdgeInsets.only(left: 10.0),
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/profile.png'),
      ),
    );
  }
}

class MessageListView extends StatelessWidget {
  final List<String> messages;

  MessageListView({required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 4.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Text(
              messages[index],
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
