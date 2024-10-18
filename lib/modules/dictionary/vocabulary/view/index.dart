import 'package:design_system_sl/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/gen/assets.gen.dart';
import 'package:flutter_app/modules/dictionary/show_dictionary.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';
import 'package:flutter_app/utils/navigator_key.dart';
import 'package:flutter_svg/svg.dart';

class DictionaryVocabularyScreen extends StatefulWidget {
  const DictionaryVocabularyScreen({super.key, required this.title, required this.data});
  final String title;
  final List<DataVocabularyOfDictionaryModel> data;
  @override
  State<DictionaryVocabularyScreen> createState() =>
      _DictionaryVocabularyScreenState();
}

class _DictionaryVocabularyScreenState
    extends State<DictionaryVocabularyScreen> {
  // final data = [
  //   DataVocabularyOfDictionaryModel(
  //     name: "Con chó",
  //     imageLocation: "assets/animal_image/concho.jpg",
  //   ),
  //   DataVocabularyOfDictionaryModel(
  //     name: "Con mèo",
  //     imageLocation: "assets/animal_image/conmeo.jpg",
  //   ),
  //   DataVocabularyOfDictionaryModel(
  //     name: "Con sóc",
  //     imageLocation: "assets/animal_image/consoc.jpg",
  //   ),
  //   DataVocabularyOfDictionaryModel(
  //     name: "Con hổ",
  //     imageLocation: "assets/animal_image/conho.jpg",
  //   ),
  //   DataVocabularyOfDictionaryModel(
  //     name: "Con gấu trúc",
  //     imageLocation: "assets/animal_image/gautruc.jpg",
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: CustomAppbar.basic(
        onTap: () => Navigator.pop(context),
        title: widget.title,
      ),
      body: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 2,
        children: widget.data
            .map((e) =>
                vocabularyWidget(e.name, e.imageLocation, e.videoLocation))
            .toList(),
      ),
    );
  }

  Widget vocabularyWidget(
    String nameVocabulary,
    String? linkImageVocabulary,
    String? linkVideoVocabulary,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            getContext,
            MaterialPageRoute(
              builder: (context) => ShowVocabularyDictionary(
                name: nameVocabulary,
                imageLocation: linkImageVocabulary,
                videoLocation: linkVideoVocabulary,
              ),
            ));
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: AppColors.white),
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
            const SizedBox(
              height: 4,
            ),
            Expanded(
                child: _buildViewForAttachment(
              getContext,
              nameVocabulary,
              linkImageVocabulary,
              linkVideoVocabulary,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            getContext,
                            MaterialPageRoute(
                              builder: (context) => ShowVocabularyDictionary(
                                name: nameVocabulary,
                                imageLocation: linkImageVocabulary,
                                videoLocation: linkVideoVocabulary,
                              ),
                            ));
                      },
                      child: Text(
                        'Xem chi tiết >',
                        style: PrimaryFont.bold(13)
                            .copyWith(color: AppColors.primaryColor),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
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
                    label:
                        const Text("Chia sẻ", style: TextStyle(fontSize: 15))),
              ),
              PopupMenuItem<Widget>(
                child: ElevatedButton.icon(
                    onPressed: () => {},
                    icon: const Icon(Icons.motorcycle_outlined,
                        size: 15, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orangeColor),
                    label:
                        const Text('Tải về', style: TextStyle(fontSize: 15))),
              ),
              PopupMenuItem<Widget>(
                child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.assignment_outlined,
                        size: 15, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blue),
                    label: const Text("Lưu vào danh sách từ vựng cá nhân",
                        style: TextStyle(fontSize: 15))),
              ),
            ]);
  }

  Widget _buildViewForAttachment(
    BuildContext context,
    String name,
    String? linkImageVocabulary,
    String? linkVideoVocabulary,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
            getContext,
            MaterialPageRoute(
              builder: (context) => ShowVocabularyDictionary(
                name: name,
                imageLocation: linkImageVocabulary,
                videoLocation: linkVideoVocabulary,
              ),
            ));
      },
      child: Stack(
        children: [
          if (linkVideoVocabulary != null) ...[
            Image.asset(
              linkVideoVocabulary,
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
          if (linkImageVocabulary != null) ...[
            Image.asset(
              linkImageVocabulary,
              width: 128,
              height: 128,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 90,
                  height: 90,
                  color: const Color(0xFF007AFF),
                );
              },
            ),
          ],
          if (linkVideoVocabulary != null && linkImageVocabulary != null) ...[
            Assets.image.logo.image(
              width: 128,
              height: 128,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 90,
                  height: 90,
                  color: const Color(0xFF007AFF),
                );
              },
            )
          ]
        ],
      ),
    );
  }
}

class DataVocabularyOfDictionaryModel {
  String name;
  String? videoLocation;
  String? imageLocation;
  DataVocabularyOfDictionaryModel({
    required this.name,
    this.imageLocation,
    this.videoLocation,
  });
}
