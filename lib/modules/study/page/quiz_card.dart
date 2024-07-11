// import 'package:devquiz/core/core.dart';
// import 'package:devquiz/shared/widgets/progressindicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/data/term/app_images.dart';
import 'package:flutter_app/data/term/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizCardWidget extends StatelessWidget {
  final Size size;
  final String title;
  // final String progressText;
  // final double progressPercent;
  final VoidCallback onTap;

  const QuizCardWidget({
    Key? key,
    required this.title,
    //required this.progressText,
    required this.onTap,
     required this.size,
    //this.progressPercent = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: size.height*0.3,
      //width: size.height*0.3,
        //padding: EdgeInsets.all(10),
        decoration: BoxDecoration(        
          border: Border.fromBorderSide(
            BorderSide(
              color: Color.fromARGB(255, 100, 51, 190),
            ),
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.blocks,fit: BoxFit.cover,),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.lato(),
              ),
            ),
            // SizedBox(
            //   height: 24,
            // ),
            // Row(
            //   children: [
            //     Expanded(
            //       flex: 1,
            //       child: Text(
            //         progressText,
            //         style: AppTextStyles.body11,
            //       ),
            //     ),
            //     Expanded(
            //       flex: 4,
            //       child: ProgressIndicatorWidget(
            //         value: progressPercent,
            //       ),
            //     )
            //   ],
            // )
          ],
        ));
  }
}
