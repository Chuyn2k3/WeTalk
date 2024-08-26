
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/challenge/challenge_controller.dart';
import 'package:flutter_app/modules/challenge/result/result_page.dart';
import 'package:flutter_app/modules/challenge/widget/next_button/next_button.dart';
import 'package:flutter_app/modules/challenge/widget/question_indicator.dart';
import 'package:flutter_app/modules/challenge/widget/quiz/quiz_widget.dart';
import 'package:flutter_app/modules/study/model/question_model.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';

class ChallengePage extends StatefulWidget {
  final QuestionStudyModel questions;
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
  var question = [];
  @override
  void initState() {
    if (widget.questions.data != null) {
      question = widget.questions.data ?? [];
    }

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

  void previousPage(int duration) {
    if (controller.currentPage > 0) {
      pageController.previousPage(
          duration: Duration(milliseconds: duration), curve: Curves.linear);
    }
  }

  void onSelected(bool value) {
    if (value) {
      controller.rightAnswers++;
    }

    nextPage(1000);
  }

  Widget _previousButton(VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(99),
        ),
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
          size: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseScaffold(
      appBar:CustomAppbar.basic(
        onTap: () => Navigator.pop(context),
      ),
      body: (question.isNotEmpty)
          ? Column(
            children: [
              ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) => QuestionIndicatorWidget(
                        currentPage: value,
                        length: widget.questions.data?.length ?? 0,
                      )),
              Expanded(
                child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                    children: question
                        .map((e) => QuizWidget(
                              question: e,
                              onSelected: onSelected,
                            ))
                        .toList(),
                  ),
              ),
            ],
          )
          : const SizedBox.shrink(),
      bottom: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ValueListenableBuilder(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (controller.currentPage > 0)
                  Expanded(
                      child: NextButtonWidget.white(
                    label: 'Lùi',
                    onTap: () => previousPage(300),
                  )),
                const SizedBox(
                  width: 16,
                ),
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
