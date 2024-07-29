import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/modules/study/page/study/vocabulary_by_topic.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:shimmer/shimmer.dart';

class TopicItem extends StatelessWidget {
  const TopicItem(
      {super.key,
      required this.linkImage,
      required this.topicName,
      required this.topicId});
  final String linkImage;
  final String topicName;
  final int topicId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => VocabularyByTopic(topicId: topicId),));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (linkImage.isNotEmpty)
              Expanded(
                flex: 3,
                child: Image.network(
                  width: 90,
                  height: 90,
                  linkImage,
                  errorBuilder: (context, error, stackTrace) {
                    return Container();
                  },
                ),
              ),
            if (linkImage.isEmpty)
              Expanded(
                flex: 3,
                child: Image.asset(
                  width: 90,
                  height: 90,
                  'assets/image/topic_image.png',
                  errorBuilder: (context, error, stackTrace) {
                    return Container();
                  },
                ),
              ),
            Expanded(
              flex: 2,
              child: Text(
                topicName,
                style: textTheme.t16M.copyWith(color: AppColors.bgBlueDark),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.red,
                    highlightColor: Colors.yellow,
                    child: const Text(
                      "Ấn vào để học từ vựng",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
