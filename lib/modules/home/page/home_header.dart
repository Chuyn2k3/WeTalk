import 'package:flutter/material.dart';
import 'package:flutter_app/modules/search/page/search_by_voice.dart';
import 'package:flutter_app/modules/search/page/search_vocabulary.dart';
import 'package:flutter_app/utils/common_app.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.fromLTRB(8, 16, 2, 8),
      child: Row(
        children: [
          const SizedBox(
            width: 4,
          ),
          Expanded(
            child: Text(
              'Học Tập',
              style: textTheme.t24B,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                height: 38,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchVocabularyByText(),
                      )),
                  child: Container(
                    //padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    //margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey), // Icon tìm kiếm
                        SizedBox(width: 8),
                        Text(
                          "Tìm kiếm...", // Văn bản mặc định
                          style: TextStyle(
                              color: Color.fromARGB(255, 110, 107, 107)),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(
            width: 12,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchByVoice(),
                  ));
            },
            child: SizedBox(
                height: 36,
                width: 36,
                child: Image.asset("assets/icon/microphone.png")),
          ),
          const SizedBox(
            width: 4,
          ),
        ],
      ),
    );
  }
}
