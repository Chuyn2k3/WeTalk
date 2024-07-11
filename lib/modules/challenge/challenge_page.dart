// import 'package:DevQuiz/challenge/challenge_controller.dart';
// import 'package:DevQuiz/challenge/widget/next_button/next_button_widget.dart';
// import 'package:DevQuiz/challenge/widget/question_indicator/question_indicator_widget.dart';
// import 'package:DevQuiz/challenge/widget/quiz/quiz_widget.dart';
// import 'package:DevQuiz/result/result_page.dart';
// import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/challenge/challenge_controller.dart';
import 'package:flutter_app/modules/challenge/model/question/question_model.dart';
import 'package:flutter_app/modules/challenge/result/result_page.dart';
import 'package:flutter_app/modules/challenge/widget/next_button/next_button.dart';
import 'package:flutter_app/modules/challenge/widget/question_indicator.dart';
import 'package:flutter_app/modules/challenge/widget/quiz/quiz_widget.dart';

class ChallengePage extends StatefulWidget {
  final QuestionModel questions;
  final String title;

  const ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();
  // CachedVideoPlayerController? _controller;
  // CustomVideoPlayerController? _customVideoPlayerController;
  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });

    super.initState();
  }

  void nextPage(int duration) {
    if (controller.currentPage < widget.questions.data!.length) {
      pageController.nextPage(
          duration: Duration(milliseconds: duration), curve: Curves.linear);
    }
  }

  void onSelected(bool value) {
    if (value) {
      controller.rightAnswers++;
    }

    nextPage(1000);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.11),
        child: SafeArea(
          top: true,
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(),
                ValueListenableBuilder<int>(
                    valueListenable: controller.currentPageNotifier,
                    builder: (context, value, _) => QuestionIndicatorWidget(
                          currentPage: value,
                          length: widget.questions.data!.length,
                        )),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions.data!
            .map((e) => QuizWidget(
                  question: e,
                  onSelected: onSelected,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ValueListenableBuilder(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (controller.currentPage < widget.questions.data!.length)
                  Expanded(
                      child: NextButtonWidget.white(
                    label: 'Tiếp',
                    onTap: () => nextPage(300),
                  )),
                if (value == widget.questions.data!.length)
                  Expanded(
                    child: NextButtonWidget.green(
                      label: 'Kết thúc',
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultPage(
                              title: widget.title,
                              length: widget.questions.data!.length,
                              result: controller.rightAnswers,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
