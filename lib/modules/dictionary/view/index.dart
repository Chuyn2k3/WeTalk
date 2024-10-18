import 'package:design_system_sl/theme/components/button/enums.dart';
import 'package:design_system_sl/theme/components/button/sl_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/dictionary/vocabulary/view/index.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/card.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';
import 'package:flutter_svg/svg.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: CustomAppbar.basic(
        onTap: () => Navigator.pop(context),
        widgetTitle: const Text(
          "Từ vựng",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            alignment: Alignment.centerLeft,
            icon: SvgPicture.asset(
              "assets/icon/download.svg",
              width: 48,
            ),
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    title: const Text("Tải xuống"),
                    alignment: Alignment.center,
                    content: const Text(
                        "Tải xuống dữ liệu để có thêm xem khi ofline, vui lòng giữ kết nối mạng khi đang tải"),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 36,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: const Center(
                                    child: Text(
                                      "Hủy",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 36,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: const Center(
                                    child: Text(
                                      "Đồng ý",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 4,
            child: WhiteRoundedCornersCard(
              child: Image.asset("assets/image/app_logo2.png"),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          // Expanded(
          //   child: ListView.builder(
          //     padding: EdgeInsets.zero,
          //     itemCount: 10,
          //     itemBuilder: (context, index) {
          //       return _buildItem(
          //         "assets/icon/letter.svg",
          //         "Động vật",
          //         "các con vật gần gũi, thân quen",
          //       );
          //     },
          //   ),
          // ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildItem(
                  "assets/icon/letter.svg",
                  "Động vật",
                  "các con vật gần gũi, thân quen",
                ),
                _buildItem(
                  "assets/icon/letter.svg",
                  "Gia đình",
                  "Người thân quen trong gia đình ",
                ),
                _buildItem(
                  "assets/icon/letter.svg",
                  "Đồ vật",
                  "Đồ vật quen thuộc xung quanh",
                ),
                _buildItem(
                  "assets/icon/letter.svg",
                  "Câu văn bản",
                  "Các câu nói đơn giản, dễ học",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String imageLink, String title, String content) {
    List<DataVocabularyOfDictionaryModel> _data = data;
    if (title == "Động vật") {
      _data = data;
    }
    if (title == "Gia đình") {
      _data = data1;
    }
    if (title == "Đồ vật") {
      _data = data2;
    }

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DictionaryVocabularyScreen(
              title: title,
              data: _data,
            ),
          ),
        );
      },
      child: SizedBox(
        child: WhiteRoundedCornersCard(
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.pink),
                width: 56,
                height: 56,
                margin: const EdgeInsets.all(16),
                child: SvgPicture.asset(
                  imageLink,
                  color: Colors.white,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    content,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  final data = [
    DataVocabularyOfDictionaryModel(
      name: "Con chó",
      imageLocation: "assets/animal_image/concho.jpg",
    ),
    DataVocabularyOfDictionaryModel(
      name: "Con mèo",
      imageLocation: "assets/animal_image/conmeo.jpg",
    ),
    DataVocabularyOfDictionaryModel(
      name: "Con sóc",
      imageLocation: "assets/animal_image/consoc.jpg",
    ),
    DataVocabularyOfDictionaryModel(
      name: "Con hổ",
      imageLocation: "assets/animal_image/conho.jpg",
    ),
    DataVocabularyOfDictionaryModel(
      name: "Con gấu trúc",
      imageLocation: "assets/animal_image/gautruc.jpg",
    ),
  ];

  final data1 = [
    DataVocabularyOfDictionaryModel(
      name: "Ông bà",
      imageLocation: "assets/family_image/ongba.jpg",
    ),
    DataVocabularyOfDictionaryModel(
      name: "Gia đình",
      imageLocation: "assets/family_image/giadinh.jpg",
    ),
    DataVocabularyOfDictionaryModel(
      name: "Em bé",
      imageLocation: "assets/family_image/embe.jpg",
    ),
    DataVocabularyOfDictionaryModel(
      name: "Bé trai",
      imageLocation: "assets/family_image/betrai.jpg",
    ),
    DataVocabularyOfDictionaryModel(
      name: "Bé gái",
      imageLocation: "assets/family_image/begai.jpg",
    ),
  ];

  final data2 = [
    DataVocabularyOfDictionaryModel(
      name: "Cái bàn",
      imageLocation: "assets/object_image/ban.jpg",
    ),
    DataVocabularyOfDictionaryModel(
      name: "Cái ghế",
      imageLocation: "assets/object_image/ghe.jpg",
    ),
    DataVocabularyOfDictionaryModel(
      name: "Bình nước",
      imageLocation: "assets/object_image/binhnuoc.jpg",
    ),
    DataVocabularyOfDictionaryModel(
      name: "Đồng hồ",
      imageLocation: "assets/object_image/dongho.jpg",
    ),
    DataVocabularyOfDictionaryModel(
      name: "Máy ảnh",
      imageLocation: "assets/object_image/mayanh.jpg",
    ),
  ];
}
