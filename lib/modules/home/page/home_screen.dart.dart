import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_gradients.dart';
import 'package:flutter_app/data/term/app_term.dart';
import 'package:flutter_app/data/term/constants.dart';
import 'package:flutter_app/data/term/text_style.dart';
import 'package:flutter_app/gen/assets.gen.dart';
import 'package:flutter_app/modules/chat/page/fragment_talk_chat_home.dart';
import 'package:flutter_app/modules/friend/page/friend.dart';
import 'package:flutter_app/modules/home/bloc/vocabulary_by_topic_cubit.dart';
import 'package:flutter_app/modules/home/page/CustomCard.dart';
import 'package:flutter_app/modules/home/page/home_header.dart';
import 'package:flutter_app/modules/home/page/study_action/study_action.dart';
import 'package:flutter_app/modules/home/widget/card_widget.dart';
import 'package:flutter_app/modules/home/widget/item.dart';
import 'package:flutter_app/modules/notification/page/notification_screen.dart';
import 'package:flutter_app/modules/personal/page/fragment_talk_profile.dart';
import 'package:flutter_app/modules/upload/page/upload_screen.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeHeader(),
                SizedBox(height: size.height * 0.03),
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
                const SizedBox(
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
                SizedBox(height: size.height * 0.02),
                Text(
                  'KHÁM PHÁ',
                  style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                BlocBuilder<VocabularyByTopicCubit, VocabularyByTopicState>(
                  builder: (context, state) {
                    if (state is VocabularyByTopicLoadingState) {
                      return const CircularProgressIndicator();
                    }
                    if (state is VocabularyByTopicLoadedState) {
                      return CardWidget(
                          vocabularyModel: state.VocabularyByTopic);
                    }
                    return const SizedBox.shrink();
                  },
                ),
                const ActionStudy(),
                SizedBox(height: size.height * 0.025),
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
