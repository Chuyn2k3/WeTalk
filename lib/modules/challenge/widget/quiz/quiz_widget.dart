import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

// import 'package:DevQuiz/challenge/widget/answer/answer_widget.dart';
// import 'package:DevQuiz/core/core.dart';
// import 'package:DevQuiz/shared/models/answer_model.dart';
// import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter_app/data/term/text_style.dart';
import 'package:flutter_app/modules/challenge/model/question/question_model.dart';
import 'package:flutter_app/modules/challenge/widget/answer/answer_widget.dart';

class QuizWidget extends StatefulWidget {
  final Data question;
  final ValueChanged<bool> onSelected;
  const QuizWidget({
    Key? key,
    required this.question,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;
  CachedVideoPlayerController? _controller;
  CustomVideoPlayerController? _customVideoPlayerController;
  AnswerResList answer(int index) => widget.question.answerResList![index];
  bool isSign = true;
  @override
  void initState() {
    super.initState();
    if (widget.question.videoLocation != null) {
      isSign = false;
      _controller =
          CachedVideoPlayerController.network(widget.question.videoLocation);
      _controller!.initialize().then((_) {
        setState(() {});
        _controller!.setLooping(true);
        _controller!.play();
      });
      _customVideoPlayerController = CustomVideoPlayerController(
          context: context, videoPlayerController: _controller!);
      //isSign = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (_controller != null && _controller!.value.isInitialized || isSign) {
      return Padding(
        padding: const EdgeInsets.all(16),
          child: Container(
            child: Column(
              children: [
                // SizedBox(
                //   height: 64,
                // ),
                Text(
                  widget.question.content!,
                  style: AppTextStyles.heading,
                ),
                widget.question.videoLocation != null
                    ? Center(
                        child: _controller != null &&
                                _controller!.value.isInitialized
                            ? AspectRatio(
                    
                                aspectRatio: _controller!.value.aspectRatio,
                                child: CustomVideoPlayer(
                    
                                  customVideoPlayerController:
                                      _customVideoPlayerController!,
                                ),
                              )
                            : CircularProgressIndicator(),
                      )
                    : SizedBox(),
                SizedBox(
                  height: 24,
                ),
                for (var i = 0; i < widget.question.answerResList!.length; i++)
                  AnswerWidget(
                    answer: answer(i),
                    disabled: indexSelected != -1,
                    isSelected: indexSelected == i,
                    onTap: (value) {
                      widget.onSelected(value);
                      indexSelected = i;
                      setState(() {});
                    },
                  ),
              ],
            ),
          ),
        
      );
    } else {
      return Container(
        height: size.height * 0.2,
        //width: size.width * 0.9,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
