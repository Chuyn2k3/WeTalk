import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/modules/study/page/question/question_all_screen.dart';
import 'package:flutter_app/modules/study/page/question/question_classroom.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: CustomAppbar.basic(
        title: "Bài kiểm tra",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AllQuestionScreen()));
              },
              child: _typeVocabulary(
                  "Tất cả bài kiểm tra", "", "assets/icon/excercise.webp")),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuestionClassroomScreen(),
                    ));
              },
              child: _typeVocabulary(
                  "Kiểm tra theo lớp học", "", "assets/image/classroom.png"))
        ],
      ),
    );
  }

  Widget _typeVocabulary(
    String title,
    String content,
    String linkImage,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      height: 100,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            linkImage,
            height: 60,
            width: 60,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  title,
                  style: textTheme.t16M.copyWith(color: AppColors.chartPrimary),
                ),
                Text(
                  content,
                  style: textTheme.t12M.copyWith(color: AppColors.chartPrimary),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
