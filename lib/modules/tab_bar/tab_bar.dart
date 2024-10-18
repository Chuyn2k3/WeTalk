import 'package:flutter/material.dart';
import 'package:flutter_app/modules/home/page/home_screen.dart.dart';
import 'package:flutter_app/modules/personal/page/user_profile.dart';
import 'package:flutter_app/modules/upload/page/upload_screen.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:lottie/lottie.dart';

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
      const HomeScreen(),
      //const ChatMainScreen(),
      //const UpLoad(),
      //const HistoryNotificationScreen(),
      const UserProfileScreen(),
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
              child: Image.asset(
                'assets/image/learning.png',
              )),
          activeIcon: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                'assets/image/learning.png',
                color: Colors.blue,
              )),
          label: "Học tập",
          backgroundColor: Colors.transparent),
      // BottomNavigationBarItem(
      //     icon: SizedBox(
      //         height: 30,
      //         width: 30,
      //         child: Image.asset(
      //           'assets/image/chat.png',
      //         )),
      //     activeIcon: SizedBox(
      //         height: 30,
      //         width: 30,
      //         child: Image.asset(
      //           'assets/image/chat.png',
      //           color: Colors.blue,
      //         )),
      //     label: "Trò chuyện",
      //     backgroundColor: Colors.transparent),
      // BottomNavigationBarItem(
      //     icon: SizedBox(
      //         height: 30,
      //         width: 30,
      //         child: Image.asset(
      //           'assets/image/cloud-computing.png',
      //         )),
      //     activeIcon: SizedBox(
      //         height: 30,
      //         width: 30,
      //         child: Image.asset(
      //           'assets/image/cloud-computing.png',
      //           color: Colors.blue,
      //         )),
      //     label: "Cung cấp",
      //     backgroundColor: Colors.transparent),
      // BottomNavigationBarItem(
      //     icon: SizedBox(
      //         height: 30,
      //         width: 30,
      //         child: Image.asset(
      //           'assets/image/notification.png',
      //         )),
      //     activeIcon: SizedBox(
      //         height: 30,
      //         width: 30,
      //         child: Image.asset(
      //           'assets/image/notification.png',
      //           color: Colors.blue,
      //         )),
      //     label: "Thông báo",
      //     backgroundColor: Colors.transparent),
      BottomNavigationBarItem(
          icon: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                'assets/image/user.png',
              )),
          activeIcon: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                'assets/image/user.png',
                color: Colors.blue,
              )),
          label: "Cá nhân",
          backgroundColor: Colors.transparent),
    ];

    Widget bottomNavigationBar = BottomNavigationBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
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
      selectedLabelStyle: textTheme.t10M.copyWith(color: colorApp.blue),
      unselectedLabelStyle:
          textTheme.t10R.copyWith(color: colorApp.labelSecondary),
      items: listItems,
    );

    return Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: _selectedScreenIndex,
          children: pages,
        ),
        floatingActionButton: SizedBox(
          height: 70,
          width: 70,
          child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UpLoadScreen(),
                    ));
              },
              backgroundColor: Colors.blue,
              shape: const CircleBorder(),
              child: Lottie.asset(
                'assets/animation/up.json',
              )),
        ),
        floatingActionButtonLocation: CustomFABLocation(),
        bottomNavigationBar: CustomPaint(
          painter: BottomBarPainter(),
          child: SizedBox(child: bottomNavigationBar),
        ));
  }
}

class BottomBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.white;
    const double notchWidth = 100; // Độ rộng của phần lõm
    const double notchDepth = 60; // Độ sâu của phần lõm

    final Path path = Path()
      ..moveTo(0, 0) // Bắt đầu từ mép trái
      ..lineTo(
          (size.width - notchWidth) / 2, 0) // Vẽ đến trước khi gặp phần lõm
      ..quadraticBezierTo(
        size.width / 2, notchDepth, // Tạo phần lõm với độ sâu
        (size.width + notchWidth) / 2, 0,
      )
      ..lineTo(size.width, 0) // Vẽ đến mép phải của `BottomAppBar`
      ..lineTo(size.width, size.height) // Vẽ xuống dưới
      ..lineTo(0, size.height) // Vẽ ngang trở về mép trái
      ..close();

    // Vẽ phần nền của BottomNavigationBar
    canvas.drawShadow(path, Colors.black26, 8.0, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Không cần repaint lại
  }
}

class CustomFABLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = (scaffoldGeometry.scaffoldSize.width -
            scaffoldGeometry.floatingActionButtonSize.width) /
        2;
    final double fabY = scaffoldGeometry.scaffoldSize.height -
        scaffoldGeometry.floatingActionButtonSize.height -
        40; // Giảm chiều cao xuống

    return Offset(fabX, fabY);
  }
}
