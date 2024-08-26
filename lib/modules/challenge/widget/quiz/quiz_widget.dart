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
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            widget.question.content!,
            style: AppTextStyles.heading,
          ),
          const SizedBox(height: 8,),
          if (videoLocation.isNotEmpty)
            Center(
              child: _controller != null && _controller!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    )
                  : const CircularProgressIndicator(),
            ),
          if (imageLocation.isNotEmpty)
            Image.network(imageLocation, height: 200),
          const SizedBox(
            height: 24,
          ),
          for (var i = 0; i < widget.question.answerResList!.length; i++)
            AnswerWidget(
              answer: widget.question.answerResList![i],
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
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
