import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_gradients.dart';
import 'package:flutter_app/data/term/app_term.dart';
import 'package:flutter_app/data/term/constants.dart';
import 'package:flutter_app/data/term/text_style.dart';
import 'package:flutter_app/modules/chat/page/fragment_talk_chat_home.dart';
import 'package:flutter_app/modules/friend/page/friend.dart';
import 'package:flutter_app/modules/home/page/CustomCard.dart';
import 'package:flutter_app/modules/home/widget/item.dart';
import 'package:flutter_app/modules/notification/page/notification_screen.dart';
import 'package:flutter_app/modules/personal/page/fragment_talk_profile.dart';
import 'package:flutter_app/modules/upload/page/upload_screen.dart';
import 'package:flutter_app/upload_video.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:unicons/unicons.dart';

import '../../chat/page/fragment_talk_chat.dart';
import '../../study/page/fragment_talk_study.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home_screen';

  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoggedIn = false;
  String dateTimeFormat() {
    // Trạng thái đăng nhập
    var now = DateTime.now();
    final formatter = DateFormat('dd/MM/yyyy');
    var time = formatter.format(now);
    return time;
    //var formatter = DateFormat('dd/MM/yyyy');
  }

  PageController? _pageController;
  var selectedIndex = 0;
  Timer? _timer;
  int _currentPage = 0;
  final int _numPages = 4;
  final int _duration = 3; // in seconds
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: _duration), (timer) {
      if (_currentPage < _numPages - 1) {
        _currentPage++;
      } else {
        _currentPage = _currentPage % (_numPages - 1);
      }
      _pageController!.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 98, 105, 229),
      //backgroundColor: Color.fromARGB(255, 61, 34, 218),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          top: size.width * 0.05,
                        ),
                        //color: Colors.black,
                        height: size.height * 0.05,
                        width: size.width * 0.75,
                        //alignment: Alignment.bottomCenter,
                        //padding: EdgeInsets.all(6.0),
                        //margin: EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                          color: kBgColor,
                          //color: Colors.black,
                          borderRadius: BorderRadius.circular(25),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.black12,
                          //     blurRadius: 8,
                          //     offset: Offset(3, 3),
                          //   ),
                          // ],
                        ),
                        child: Container(
                          //padding: EdgeInsets.all(8),
                          child: TextFormField(
                            //cursorHeight: 15,

                            ///onChanged: search,
                            //maxLength: 500,
                            //expands: true,
                            //controller: _textEditingController,
                            decoration: const InputDecoration(

                                //filled: true,
                                //fillColor: AppColors.white2,
                                // contentPadding:
                                //     EdgeInsets.symmetric(vertical: 5),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(width: 0.8),
                                ),
                                hintText: 'Tìm kiếm',
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 30,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(width: 0.8),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      bottomLeft: Radius.circular(30)),
                                  borderSide: BorderSide(
                                    width: 4,
                                    color: Colors.blue,
                                  ),
                                )),
                          ),
                        )),
                    //textFormField(),
                    // Text(
                    //   'Trang chủ',
                    //   style: TextStyle(
                    //     color: Colors.black87,
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 20,
                    //   ),
                    // ),
                    Container(
                      height: size.height * 0.045,
                      width: size.width * 0.095,
                      decoration: BoxDecoration(
                        color: kBgColor,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      child: InkWell(
                        child: Icon(
                          Icons.notifications_none,
                          color: kDarkGreyColor,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotificationScreen()));
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      child: InkWell(
                        child: ClipOval(
                          //borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/images/anh_CV.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              ));
                        },
                      ),
                    ),
                    SizedBox(width: size.width * 0.05),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dateTimeFormat(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: size.height * 0.02),
                        ),
                        Gap(size.height * 0.02),
                        Text('Xin chào, Chuyên!',
                            style: AppTextStyles.userHome),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.05),
                SizedBox(
                  height: 100,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    controller: _pageController,
                    itemCount: _numPages,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return BannerItem(desc[index], size);
                    },
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(4, (index) {
                      return Indicator(
                        isActive: selectedIndex == index ? true : false,
                        size: size,
                      );
                    })
                  ],
                ),
                SizedBox(height: size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: HomeFunctionCustomCard(
                        size: size,
                        icon: Icon(
                          UniconsLine.chat_bubble_user,
                          //Icons.chat_rounded,
                          size: 55,
                          color: hBlueColor,
                        ),
                        title: AppHome.chat,

                        // statusOn: "OPEN",
                        // statusOff: "LOCKED",
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatMainScreen(),
                            ));
                      },
                    ),
                    InkWell(
                      child: HomeFunctionCustomCard(
                        size: size,
                        icon: Icon(UniconsLine.book_open,
                            size: 55,
                            //color: Colors.yellow.shade400 //Colors.grey.shade400,
                            color: hYellowColor),
                        title: AppHome.study,
                        // statusOn: "ON",
                        // statusOff: "OFF",
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TalkStudyScreen()),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.025),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: HomeFunctionCustomCard(
                        size: size,
                        icon: Icon(
                          Icons.cloud_upload_outlined,
                          size: 55,
                          color: kGreenColor,
                        ),
                        title: AppHome.upload,
                        // statusOn: "DETECTED",
                        // statusOff: "NOT DETECTED",
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpLoad(),
                            ));
                      },
                    ),
                    InkWell(
                      child: HomeFunctionCustomCard(
                        size: size,
                        icon: Icon(
                          UniconsLine.user,
                          size: 55,
                          //color: Colors.grey.shade400,
                        ),
                        title: AppHome.connect,
                        // statusOn: "ON",
                        // statusOff: "OFF",
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FriendConectScreen()));
                      },
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.025),
                Container(
                  height: size.height * 0.085,
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: kBgColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(3, 3),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 0,
                        offset: Offset(-3, -3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.05),
                    child: Row(
                      //textDirection: Center(child: Text),
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            AppHome.logout,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: logout,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        //SizedBox(width:size.width*0.1),
                        Icon(
                          Icons.logout_outlined,
                          size: 40,
                          color: logout,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    _pageController!.dispose();
    super.dispose();
  }
}

class Indicator extends StatelessWidget {
  final bool isActive;
  final Size size;
  const Indicator({super.key, required this.isActive, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? size.width * 0.3 : size.width * 0.1,
      height: 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isActive ? Colors.orange : Colors.grey,
      ),
    );
  }
}
