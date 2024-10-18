import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/modules/study/model/vocabulary_model.dart';
import 'package:flutter_app/modules/study/widget/study/show_vocabulary.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:shimmer/shimmer.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.vocabularyModel});
  final VocabularyModel? vocabularyModel;
  @override
  Widget build(BuildContext context) {
    List<Widget> stationItems = [];
    if (vocabularyModel != null) {
      stationItems = vocabularyModel!.data!
          .map((e) => StationPreViewItem(
              imageName: e.content ?? "",
              linkImage: e.vocabularyImageResList?[0].imageLocation ?? "",
              vocabularyImageResList: e.vocabularyImageResList ?? [],
              vocabularyVideoResList: e.vocabularyVideoResList ?? []))
          .toList();
    } else {
      stationItems = [
        _stationPreViewItemLoading(),
        _stationPreViewItemLoading(),
        _stationPreViewItemLoading()
      ];
    }
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: CarouselSlider(
          options: CarouselOptions(
            height: 200,
            autoPlay: false,
            enlargeCenterPage: false,
            viewportFraction: 0.7,
            onPageChanged: (index, reason) {},
          ),
          items: stationItems),
    );
  }
}

Widget _stationPreViewItemLoading() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              border: Border.fromBorderSide(
                  BorderSide(width: 0.5, color: AppColors.grey)),
              borderRadius: BorderRadius.all(Radius.circular(20)),
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
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Container(
              height: 30,
              width: 200,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const Spacer()
          ],
        )
      ],
    ),
  );
}

class StationPreViewItem extends StatelessWidget {
  const StationPreViewItem({
    super.key,
    required this.imageName,
    required this.linkImage,
    required this.vocabularyImageResList,
    required this.vocabularyVideoResList,
  });
  final String imageName;
  final String linkImage;
  final List<VocabularyImageResList> vocabularyImageResList;
  final List<VocabularyVideoResList> vocabularyVideoResList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowVocabulary(
                    vocabularyImageResList: vocabularyImageResList,
                    vocabularyVideoResList: vocabularyVideoResList,
                  ),
                ));
          },
          child: Container(
            decoration: const BoxDecoration(
              border: Border.fromBorderSide(
                  BorderSide(width: 0.5, color: AppColors.grey)),
              borderRadius: BorderRadius.all(Radius.circular(20)),
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
            child: linkImage.isNotEmpty
                ? SizedBox(
                    height: 100,
                    width: 200,
                    child: Image.network(linkImage),
                  )
                : const SizedBox.shrink(),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.mint),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    textAlign: TextAlign.left,
                    imageName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.t16B.copyWith(color: colorApp.white),
                  ),
                ),
              ),
            ),
            const Spacer()
          ],
        )
      ],
    );
  }
}
