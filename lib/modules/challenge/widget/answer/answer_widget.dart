//import 'package:DevQuiz/core/core.dart';
//import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/data/term/text_style.dart';
import 'package:flutter_app/modules/challenge/model/question/question_model.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerResList answer;
  final bool isSelected;
  final bool disabled;
  final ValueChanged<bool> onTap;

  const AnswerWidget({ 
    Key? key, 
    required this.answer,
    required this.onTap,
    this.isSelected = false, 
    this.disabled = false, 
  }) : super(key: key);

  Color get _selectedColorRight => answer.correct! ? 
    AppColors.darkGreen : 
    AppColors.darkRed;

  Color get _selectedBorderRight => answer.correct! ?
    AppColors.lightGreen :
    AppColors.lightRed;

  Color get _selectedColorCardRight => answer.correct! ?
    AppColors.lightGreen : AppColors.lightRed;

  TextStyle get _selectedTextStyle => answer.correct! ?
    AppTextStyles.bodyDarkGreen : 
    AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => answer.correct! ?
    Icons.check :
    Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: () {
            onTap(answer.correct!);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected ? _selectedColorCardRight : AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(
                BorderSide(
                  color: isSelected ? _selectedColorCardRight : AppColors.border,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    answer.content!,
                    style: isSelected ? _selectedTextStyle : AppTextStyles.body,
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: isSelected ? _selectedColorRight : AppColors.white,
                    borderRadius: BorderRadius.circular(500),
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: isSelected ? _selectedBorderRight : AppColors.border,
                      ),
                    ),
                  ),
                  child: isSelected ? 
                    Icon(
                      _selectedIconRight,
                      size: 16,
                      color: AppColors.white,
                    ) : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}