import 'package:design_system_sl/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/modules/study/model/vocabulary_model.dart';
import 'package:flutter_app/modules/study/widget/study/show_vocabulary.dart';
import 'package:flutter_app/utils/navigator_key.dart';
import 'package:flutter_svg/svg.dart';

Widget vocabularyWidget(
  String nameVocabulary,
  String linkVideoVocabulary,
  String linkImageVocabulary,
  List<VocabularyImageResList> vocabularyImageResList,
  List<VocabularyVideoResList> vocabularyVideoResList,
) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          getContext,
          MaterialPageRoute(
            builder: (context) => ShowVocabulary(
              vocabularyImageResList: vocabularyImageResList,
              vocabularyVideoResList: vocabularyVideoResList,
            ),
          ));
    },
    child: Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      height: 120,
      width: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.white),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  nameVocabulary,
                  style: PrimaryFont.bold(11)
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
              _popUpMenu(getContext)
            ],
          ),
          SizedBox(
              height: 60,
              width: 100,
              child: _buildViewForAttachment(getContext, linkVideoVocabulary)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Xem chi tiết >',
                    style: PrimaryFont.bold(13)
                        .copyWith(color: AppColors.primaryColor),
                  )),
            ],
          )
        ],
      ),
    ),
  );
}

Widget _popUpMenu(BuildContext context) {
  return PopupMenuButton(
      tooltip: 'more',
      icon: const Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Widget>>[
            PopupMenuItem<Widget>(
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_rounded,
                      size: 15, color: Colors.white),
                  label: const Text("Xem chi tiết",
                      style: TextStyle(fontSize: 15))),
            ),
            PopupMenuItem<Widget>(
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, size: 15, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade300),
                  label: const Text("Chia sẻ", style: TextStyle(fontSize: 15))),
            ),
            PopupMenuItem<Widget>(
              child: ElevatedButton.icon(
                  onPressed: () => {},
                  icon: const Icon(Icons.motorcycle_outlined,
                      size: 15, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orangeColor),
                  label: const Text('Tải về', style: TextStyle(fontSize: 15))),
            ),
            PopupMenuItem<Widget>(
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.assignment_outlined,
                      size: 15, color: Colors.white),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: AppColors.blue),
                  label: const Text("Lưu vào danh sách từ vựng cá nhân",
                      style: TextStyle(fontSize: 15))),
            ),
          ]);
}

Widget _buildViewForAttachment(BuildContext context, String linkAttchment) {
  return InkWell(
    onTap: () {},
    child: Stack(
      children: [
        Image.network(
          linkAttchment,
          width: 90,
          height: 90,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 90,
              height: 90,
              color: const Color(0xFF007AFF),
            );
          },
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/icon/icon_video.svg",
              width: 34,
              height: 34,
            ),
          ),
        ),
      ],
    ),
  );
}
