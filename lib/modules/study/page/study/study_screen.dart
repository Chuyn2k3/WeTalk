import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/modules/study/page/study/all_topic.dart';
import 'package:flutter_app/modules/study/page/study/classroom/classroom_screen.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';

class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: CustomAppbar.basic(
        title: "Học từ vựng",
        onTap: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Text(
                "Thỏa sức học tập",
                style: textTheme.t18M.copyWith(color: colorApp.labelPrimary),
              ),
              const SizedBox(
                height: 8,
              ),
              //const LearningMethod(),
              _typeVocabulary(
                'HỌC TẬP THEO CHỦ ĐỀ',
                () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AllTopicScreen(),
            )),
                "assets/image/topic.png",
              ),
              _typeVocabulary('HỌC TẬP THEO LỚP HỌC', () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ClassroomScreen(),
            )), "assets/image/classroom.png"),

            ],
          ),
        ),
      ),
    );
  }

  Widget _typeVocabulary(
    String title,
    VoidCallback action,
    String linkImage,
  ) {
    return GestureDetector(
      onTap: action,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(linkImage,height: 60,width: 60,),
            Expanded(
              child: Column(
                children: [
                  Text(
                    title,
                    style: textTheme.t16M.copyWith(color: AppColors.chartPrimary),
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
