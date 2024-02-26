import 'package:flutter/material.dart';
import 'package:flutter_app/modules/chat/page/fragment_talk_chat_home.dart';
import 'package:flutter_app/modules/personal/page/fragment_talk_profile.dart';
import 'package:flutter_app/upload_video.dart';

import '../../chat/page/fragment_talk_chat.dart';
import '../../study/page/fragment_talk_study.dart';

// void main() {
//   runApp(MainPage());
// }

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isLoggedIn = false; // Trạng thái đăng nhập

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: isLoggedIn ? 2 : 4,
        // Số lượng tab phụ thuộc vào trạng thái đăng nhập
        child: Scaffold(
          body: TabBarView(
            children: isLoggedIn
                ? [
              // Các tab khi đăng nhập
              Navigator(
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (context) => ChatMainScreen(),
                  );
                },
              ),
              Navigator(
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (context) => TalkStudyScreen(),
                  );
                },
              ),
            ]
                : [
              // Các tab khi chưa đăng nhập
              Navigator(
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (context) => ChatMainScreen(),
                  );
                },
              ),
              Navigator(
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (context) => TalkStudyScreen(),
                  );
                },
              ),
              Navigator(
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  );
                },
              ),
              Navigator(
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (context) => Page4(),
                  );
                },
              ),
            ],
          ),
          bottomNavigationBar: Container(
            color: Colors.grey[200],
            child: TabBar(
              tabs: isLoggedIn
                  ? [
                Tab(icon: Icon(Icons.message_rounded), text: 'Tin nhắn'),
                Tab(icon: Icon(Icons.upload_file_rounded), text: 'Học tập'),
              ]
                  : [
                Tab(icon: Icon(Icons.message_rounded), text: 'Tin nhắn'),
                Tab(icon: Icon(Icons.upload_file_rounded), text: 'Học tập'),
                Tab(icon: Icon(Icons.person), text: 'Cá nhân'),
                Tab(icon: Icon(Icons.travel_explore), text: 'Khám phá'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 4')),
      body: Center(child: Text('Content of Page 4')),
    );
  }
}