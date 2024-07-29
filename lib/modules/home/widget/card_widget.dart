import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/modules/study/model/vocabulary_model.dart';
import 'package:flutter_app/utils/common_app.dart';


class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.vocabularyModel});
  final VocabularyModel vocabularyModel;
  @override
  Widget build(BuildContext context) {
    List<Widget> stationItems = [];
    stationItems = vocabularyModel.data!.map((e) => StationPreViewItem(
        imageName: e.content ?? "", linkImage: e.vocabularyImageResList?[0].imageLocation??"")).toList();
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Align(
        //alignment: Alignment.bottomCenter,
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
            items: stationItems
          ),
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
  });
  final String imageName;
  final String linkImage;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 200,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                imageName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.t14R.copyWith(color: colorApp.labelPrimary),
              ),
              const SizedBox(height: 8),
              linkImage.isNotEmpty
                  ? SizedBox(
                      height: 80,
                      //width: 500,
                      child: Image.network(linkImage),
                    )
                  : const SizedBox.shrink()
            ]),
      ),
    );
  }
}
