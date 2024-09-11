//import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;

  final VoidCallback onTap;

  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.onTap,
  }) : super(key: key);

  const NextButtonWidget.green({super.key, required String label, required VoidCallback onTap})
    : backgroundColor = AppColors.darkGreen,
    fontColor = AppColors.white,
    borderColor = AppColors.darkGreen,
    label = label,
    onTap = onTap;

  const NextButtonWidget.purple({super.key, required String label, required VoidCallback onTap})
    : backgroundColor = AppColors.purple,
    fontColor = AppColors.white,
    borderColor = AppColors.purple,
    label = label,
    onTap = onTap;

  const NextButtonWidget.white({super.key, required String label, required VoidCallback onTap})
    : backgroundColor = AppColors.white,
    fontColor = AppColors.grey,
    borderColor = AppColors.border,
    label = label,
    onTap = onTap;

  const NextButtonWidget.transparent({super.key, required String label, required VoidCallback onTap})
    : backgroundColor = Colors.transparent,
    fontColor = AppColors.grey,
    borderColor = Colors.transparent,
    label = label,
    onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              color: borderColor,
            ),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: fontColor
          ),
        ),
      ),
    );
  }
}