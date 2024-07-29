//import 'package:DevQuiz/core/core.dart';
//import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/data/term/text_style.dart';
import 'package:flutter_app/modules/study/model/question_model.dart';


class AnswerWidget extends StatefulWidget {
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

  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  Color get _selectedColorRight =>
      widget.answer.correct! ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      widget.answer.correct! ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      widget.answer.correct! ? AppColors.lightGreen : AppColors.lightRed;

  TextStyle get _selectedTextStyle => widget.answer.correct!
      ? AppTextStyles.bodyDarkGreen
      : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight =>
      widget.answer.correct! ? Icons.check : Icons.close;


  double high = 50;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: IgnorePointer(
        ignoring: widget.disabled,
        child: GestureDetector(
          onTap: () {
            widget.onTap(widget.answer.correct!);
          },
          child: Container(
            height: high,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color:
                  widget.isSelected ? _selectedColorCardRight : AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(
                BorderSide(
                  color: widget.isSelected
                      ? _selectedColorCardRight
                      : AppColors.border,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                          widget.answer.content!,
                          style: widget.isSelected
                              ? _selectedTextStyle
                              : AppTextStyles.body,
                        ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: widget.isSelected
                        ? _selectedColorRight
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(500),
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: widget.isSelected
                            ? _selectedBorderRight
                            : AppColors.border,
                      ),
                    ),
                  ),
                  child: widget.isSelected
                      ? Icon(
                          _selectedIconRight,
                          size: 16,
                          color: AppColors.white,
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
