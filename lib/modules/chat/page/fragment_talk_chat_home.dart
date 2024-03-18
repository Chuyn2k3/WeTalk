import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';

class ChatScreen extends StatefulWidget {
  static String routeName = 'messager_screen';
  const ChatScreen({super.key});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            height: kToolbarHeight + 29.0,
            margin: EdgeInsets.only(top: size.width * 0.05),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: AppColors.chatPink),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Row(
                children: [
                  ProfilePicView(),
                  SizedBox(width: 10.0),
                  Text(
                    " Chuyên",
                    style: TextStyle(
                        //fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.videocam, color: AppColors.chatPink),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.more_vert, color: AppColors.chatPink),
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
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: _messageController,
                      decoration: InputDecoration(
                        labelStyle:
                            TextStyle(color: Colors.blue), // Màu cho label
                        // Màu cho nền của TextFormField khi không được chọn
                        fillColor: Color.fromARGB(255, 54, 47, 47),
                        filled: true,
                        hintText: 'Nhắn tin',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 83, 81, 81)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 5),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.sentiment_satisfied, color: Colors.blue),
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
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.12,
      height: size.width * 0.12,
      margin: EdgeInsets.only(left: 10.0),
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/anh_CV.jpg'),
      ),
    );
  }
}

class MessageListView extends StatelessWidget {
  final List<String> messages;

  MessageListView({required this.messages});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      padding: EdgeInsets.all(size.width * 0.05),
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
