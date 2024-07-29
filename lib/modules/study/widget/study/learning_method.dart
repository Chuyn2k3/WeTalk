import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/modules/study/page/study/all_topic.dart';
import 'package:flutter_app/modules/study/page/study/classroom/classroom_screen.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:shimmer/shimmer.dart';

class LearningMethod extends StatelessWidget {
  const LearningMethod({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> stationItems = [];
    stationItems = [
      StationPreViewItem(
        imageName: "HỌC TẬP THEO CHỦ ĐỀ",
        linkImage: "assets/image/topic.png",
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AllTopicScreen(),
            )),
      ),
      StationPreViewItem(
        imageName: "HỌC TẬP THEO LỚP HỌC",
        linkImage: "assets/image/classroom.png",
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ClassroomScreen(),
            )),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Align(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: false,
                enlargeCenterPage: false,
                viewportFraction: 0.7,
                onPageChanged: (index, reason) {},
              ),
              items: stationItems),
        ),
      ),
    );
  }
}

class StationPreViewItem extends StatelessWidget {
  const StationPreViewItem({
    super.key,
    required this.imageName,
    required this.linkImage,
    required this.onTap,
  });
  final String imageName;
  final String linkImage;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 350,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(1.0, 2.0),
              blurRadius: 2.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        margin: const EdgeInsets.all(8),
        padding:
            const EdgeInsets.only(bottom: 16, top: 16, left: 12, right: 12),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 8),
              linkImage.isNotEmpty
                  ? SizedBox(
                      height: 80,
                      //width: 500,
                      child: Image.asset(linkImage),
                    )
                  : const SizedBox.shrink(),
              Text(
                imageName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.t14R.copyWith(color: colorApp.labelPrimary),
              ),
              SizedBox(
                width: 200.0,
                height: 40.0,
                child: Shimmer.fromColors(
                  baseColor: Colors.red,
                  highlightColor: Colors.yellow,
                  child: const Text(
                    'Bắt đầu học',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
