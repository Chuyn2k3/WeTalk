import 'package:flutter/material.dart';
import 'package:flutter_app/gen/assets.gen.dart';
import 'package:flutter_app/modules/study/page/alphabet.dart';
import 'package:flutter_app/modules/study/page/numbers.dart';
import 'package:flutter_app/modules/study/page/pratice.dart';
import 'package:flutter_app/modules/study/page/question/question_screen.dart';
import 'package:flutter_app/modules/study/page/study/study_screen.dart';
import 'package:flutter_app/utils/navigator_key.dart';

enum StudyEnum { alphabet, number, exam, vocabulary, practice }

extension ExtStudyEnum on StudyEnum {
  String get title {
    switch (this) {
      case StudyEnum.alphabet:
        return 'Bảng chữ cái';
      case StudyEnum.number:
        return "Bảng chữ số";
      case StudyEnum.exam:
        return "Bài kiểm tra";
      case StudyEnum.vocabulary:
        return "Từ vựng";
      case StudyEnum.practice:
        return "Luyện tay";
    }
  }

  Widget get icon {
    switch (this) {
      case StudyEnum.alphabet:
        return Assets.image.abc.image();
      case StudyEnum.number:
        return Assets.image.numberBlocks.image();
      case StudyEnum.exam:
        return Assets.image.test.image();
      case StudyEnum.vocabulary:
        return Assets.image.dictionary.image();
      case StudyEnum.practice:
        return Assets.image.target.image();
    }
  }

  Function()? get onTap {
    switch (this) {
      case StudyEnum.alphabet:
        return () => Navigator.push(
              getContext,
              MaterialPageRoute(builder: (context) => const AlphabetScreen()),
            );
      case StudyEnum.number:
        return () => Navigator.push(
              getContext,
              MaterialPageRoute(builder: (context) => const NumberScreen()),
            );
      case StudyEnum.exam:
        return () => Navigator.push(
              getContext,
              MaterialPageRoute(builder: (context) => const ExamScreen()),
            );
      case StudyEnum.vocabulary:
        return () => Navigator.push(
              getContext,
              MaterialPageRoute(builder: (context) => const StudyScreen()),
            );
      case StudyEnum.practice:
        return () => Navigator.push(
              getContext,
              MaterialPageRoute(
                  builder: (context) => const ObjectDetectionScreen()),
            );
    }
  }
}
