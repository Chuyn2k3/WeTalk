import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_images.dart';
import 'package:flutter_app/data/term/text_style.dart';
import 'package:flutter_app/modules/challenge/widget/next_button/next_button.dart';
import 'package:flutter_app/modules/home/page/home_screen.dart.dart';
import 'package:flutter_app/modules/study/page/exam.dart';
import 'package:flutter_app/modules/study/page/question/question_screen.dart';
import 'package:flutter_app/modules/tab_bar/tab_bar.dart';

// import 'package:DevQuiz/challenge/widget/next_button/next_button_widget.dart';
// import 'package:DevQuiz/core/core.dart';
// import 'package:share_plus/share_plus.dart';

class ResultPage extends StatefulWidget {
  final String title;
  final int length;
  final int result;

  const ResultPage({
    Key? key,
    required this.title,
    required this.length,
    required this.result,
  }) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  'Chúc mừng',
                  style: AppTextStyles.heading40,
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: Text.rich(
                    TextSpan(
                      text: 'Bạn đã hoàn thành',
                      style: AppTextStyles.body,
                      children: [
                        TextSpan(
                          text: ' kiểm tra',
                          style: AppTextStyles.bodyBold,
                        ),
                        TextSpan(
                          text: ' chính xác ${widget.result} trên ${widget.length} câu hỏi,',
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.purple(
                            label: 'Làm lại',
                            onTap: () {
                              // Share.share(
                              //   'Veja meu resultado no quiz $title: $result de $length'
                              // );
                            }),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 34,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.transparent(
                            label: 'Trở về trang chính',
                            onTap: () {
                              Navigator.pop(
                          context

                        );
                            }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
