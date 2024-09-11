import 'package:flutter_app/widget/circular_indicator.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/text_style.dart';
import 'package:flutter_app/modules/challenge/widget/answer/answer_widget.dart';
import 'package:flutter_app/modules/study/model/question_model.dart';

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
  VideoPlayerController? _controller;
  String videoLocation = '';
  String imageLocation = '';
  @override
  void initState() {
    videoLocation = widget.question.videoLocation ?? "";
    imageLocation = widget.question.imageLocation ?? "";
    super.initState();
    if (videoLocation.isNotEmpty) {
      _controller = VideoPlayerController.network(videoLocation);
      _controller!.initialize().then((_) {
        setState(() {});
        _controller!.setLooping(true);
        _controller!.play();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        children: [
          Text(
            widget.question.content!,
            style: AppTextStyles.heading,
          ),
          const SizedBox(
            height: 8,
          ),
          if (videoLocation.isNotEmpty)
            Expanded(
              flex: 2,
              child: Center(
                child: _controller != null && _controller!.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: VideoPlayer(_controller!),
                      )
                    : const CircularIndicator(),
              ),
            ),
          if (imageLocation.isNotEmpty)
            Expanded(
                child:
                    Center(child: Image.network(imageLocation, height: 200))),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: widget.question.answerResList!.length,
              itemBuilder: (context, index) {
                return AnswerWidget(
                  answer: widget.question.answerResList![index],
                  disabled: indexSelected != -1,
                  isSelected: indexSelected == index,
                  onTap: (value) {
                    widget.onSelected(value);
                    indexSelected = index;
                    setState(() {});
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          // for (var i = 0; i < widget.question.answerResList!.length; i++)
          //   AnswerWidget(
          //     answer: widget.question.answerResList![i],
          //     disabled: indexSelected != -1,
          //     isSelected: indexSelected == i,
          //     onTap: (value) {
          //       widget.onSelected(value);
          //       indexSelected = i;
          //       setState(() {});
          //     },
          //   ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
