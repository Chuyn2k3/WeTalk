// import 'package:battery_nfc/battery_nfc.dart';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/chat/page/fragment_talk_chat.dart';
import 'package:flutter_app/modules/friend/page/friend.dart';
import 'package:flutter_app/modules/home/page/home_screen.dart.dart';
import 'package:flutter_app/modules/notification/page/notification_screen.dart';
import 'package:flutter_app/modules/personal/page/fragment_talk_profile.dart';
import 'package:flutter_app/modules/study/page/fragment_talk_study.dart';
import 'package:flutter_app/modules/upload/page/upload_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainTabbarScreen extends StatefulWidget {
  const MainTabbarScreen({super.key});

  @override
  State<MainTabbarScreen> createState() => _MainTabbarScreenState();
}

class _MainTabbarScreenState extends State<MainTabbarScreen> {
  int _selectedScreenIndex = 0;
  List<Widget> pages = [];

  @override
  void initState() {
    pages = [
      //const ProfilePage(),
      const HomeScreen(),
      const ChatMainScreen(),
      const UpLoad(),
      const NotificationScreen(),
      //const ProfilePage(),
      //onst ProfilePage(),
      //const ProfilePage(),
      const ProfilePage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> listItems = [
      BottomNavigationBarItem(
          icon: SizedBox(
            height: 30,
            width: 30,
            child: Image.asset('assets/image/learning.png',)),
          activeIcon: SizedBox(
             height: 30,
            width: 30,
            child: Image.asset('assets/image/learning.png',color: Colors.blue,)),
          label: "Học tập",
          backgroundColor: Colors.transparent),
      BottomNavigationBarItem(
          icon: SizedBox(height: 30,
            width: 30,child: Image.asset('assets/image/chat.png',)),
          activeIcon: SizedBox(height: 30,
            width: 30,child: Image.asset('assets/image/chat.png',color: Colors.blue,)),
          label: "Trò chuyện",
          backgroundColor: Colors.transparent),
      BottomNavigationBarItem(
          icon: SizedBox(height: 30,
            width: 30,child: Image.asset('assets/image/cloud-computing.png',)),
          activeIcon: SizedBox(height: 30,
            width: 30,child: Image.asset('assets/image/cloud-computing.png',color: Colors.blue,)),
          label: "Cung cấp",
          backgroundColor: Colors.transparent),
      BottomNavigationBarItem(
          icon: SizedBox(height: 30,
            width: 30,child: Image.asset('assets/image/notification.png',)),
          activeIcon: SizedBox(height: 30,
            width: 30,child: Image.asset('assets/image/notification.png',color: Colors.blue,)),
          label: "Thông báo",
          backgroundColor: Colors.transparent),
      BottomNavigationBarItem(
          icon: SizedBox(height: 30,
            width: 30,child: Image.asset('assets/image/user.png',)),
          activeIcon: SizedBox(height: 30,
            width: 30,child: Image.asset('assets/image/user.png',color: Colors.blue,)),
          label: "Cá nhân",
          backgroundColor: Colors.transparent),
    ];

    Widget bottomNavigationBar =
       BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: (index) {
          setState(() {
            _selectedScreenIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        selectedItemColor: Colors.blue[500],
        unselectedItemColor: Colors.grey[500],
        showUnselectedLabels: true,
        items: listItems,
    );

    return Scaffold(
        extendBody: true,
        body:IndexedStack(
                      index: _selectedScreenIndex,
                      children: pages,
                    ),
        bottomNavigationBar: bottomNavigationBar);
  }

}
