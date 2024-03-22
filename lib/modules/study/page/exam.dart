// import 'package:devquiz/challenge/challenge_page.dart';
// import 'package:devquiz/core/core.dart';
// import 'package:devquiz/home/home_controller.dart';
// import 'package:devquiz/home/home_state.dart';
// import 'package:devquiz/home/widgets/levelbutton/level_button_widget.dart';
// import 'package:devquiz/home/widgets/quizcard/quiz_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/challenge/bloc/question_bloc.dart';
import 'package:flutter_app/modules/challenge/bloc/question_bloc_event.dart';
import 'package:flutter_app/modules/challenge/bloc/question_bloc_state.dart';
import 'package:flutter_app/modules/challenge/challenge_page.dart';
import 'package:flutter_app/modules/study/page/quiz_card.dart';
import 'package:flutter_app/modules/study/widget/appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import 'widgets/appbar/app_bar_widget.dart';

class ExamPage extends StatefulWidget {
  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  //final controller = HomeController();

  @override
  void initState() {
    super.initState();
    // controller.getData();
    // controller.stateNotifier.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    QuestionBloc fetch = BlocProvider.of<QuestionBloc>(context);
    fetch.add(FetchQuestion());
    //if (controller.state == HomeState.success) {
    return Scaffold(
        appBar: AppBarWidget(context),
        //leading: ,

        // AppBarWidget(
        // ),

        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 16,
                    crossAxisCount: 4,
                    children: [
                      BlocBuilder<QuestionBloc, QuestionState>(
                          builder: (context, state) {
                        if (state is QuestionLoading) {
                          return const CircularProgressIndicator();
                        } else if (state is QuestionLoaded) {
                          return InkWell(
                            child: QuizCardWidget(
                                title: 'an',
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (contex) => ChallengePage(
                                  //         questions: state.data,
                                  //         title: state.data.message!,
                                  //       ),
                                  //     ));
                                },
                                size: size),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (contex) => ChallengePage(
                                          questions: state.data,
                                          title: state.data.message!,
                                        ),
                                      ));
                                },
                          );
                        } else
                          return Text('data');
                      }),
                      QuizCardWidget(
                        size: size,
                        title: 'oke',
                        // progressPercent:
                        //     e.answeredQuestions / e.questions.length,
                        // progressText:
                        //     "${e.answeredQuestions}/${e.questions.length}",
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ChallengePage(
                          //       questions: e.questions,
                          //       title: e.title,
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                      QuizCardWidget(
                        title: 'học tập',
                        onTap: () {},
                        size: size,
                      ),
                      QuizCardWidget(
                        size: size,
                        title: 'đồ ăn',
                        onTap: () {},
                      ),
                      QuizCardWidget(
                        size: size,
                        title: 'xem phim',
                        onTap: () {},
                      ),
                      QuizCardWidget(
                        size: size,
                        title: 'quang cảnh',
                        onTap: () {},
                      ),
                      QuizCardWidget(
                        size: size,
                        title: 'đồ uống',
                        onTap: () {},
                      ),
                      QuizCardWidget(
                        size: size,
                        title: 'xe cộ',
                        onTap: () {},
                      ),
                      QuizCardWidget(
                        size: size,
                        title: 'máy tính',
                        onTap: () {},
                      ),
                      QuizCardWidget(
                        size: size,
                        title: 'thể thao',
                        onTap: () {},
                      ),
                      QuizCardWidget(
                        size: size,
                        title: 'quần áo',
                        onTap: () {},
                      ),
                    ]
                    //.toList(),
                    ),
              ),
            ],
          ),
        ));
    // } else {
    //   return Scaffold(
    //     body: Center(
    //       child: CircularProgressIndicator(
    //         valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
    //       ),
    //     ),
    //   );
    // }
  }
}
