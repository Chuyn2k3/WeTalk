//import 'package:DevQuiz/core/core.dart';
//import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
//import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/text_style.dart';
import 'package:flutter_app/service/progress_indicator.dart';

class QuestionIndicatorWidget extends StatefulWidget {
  final int currentPage;
  final int length;
   const QuestionIndicatorWidget(
      {Key? key, required this.currentPage, required this.length, })
      : super(key: key);

  @override
  State<QuestionIndicatorWidget> createState() => _QuestionIndicatorWidgetState();
}

class _QuestionIndicatorWidgetState extends State<QuestionIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Câu hỏi ${widget.currentPage}',
                style: AppTextStyles.body,
              ),
              Text(
                'Tổng số ${widget.length}',
                style: AppTextStyles.body,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          ProgressIndicatorWidget(
            value: widget.currentPage / widget.length,
          ),
        ],
      ),
    );
  }
}
