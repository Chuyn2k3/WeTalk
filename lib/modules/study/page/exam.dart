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
import 'package:flutter_app/modules/challenge/model/question/question_model.dart';
import 'package:flutter_app/modules/screens/load_pageStudy.dart';
import 'package:flutter_app/modules/study/model/topic_model.dart';
import 'package:flutter_app/modules/study/page/quiz_card.dart';
import 'package:flutter_app/modules/study/repo/topic_repo.dart';
import 'package:flutter_app/modules/study/widget/appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import 'widgets/appbar/app_bar_widget.dart';

class ExamPage extends StatefulWidget {



  static String routeName = "exam_screen";
  const ExamPage({
    Key? key,
    
  }) : super(key: key);

  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  //final controller = HomeController();
  List<int> idTopics = [];
  List<String> nameTopics = [];
  Future<List<DataTopic>?> getTopics() async {
    TopicModel? topics = await StudyRepo.diogetAllTopic();
    List<DataTopic>? dataTopic = topics!.data!.toList();
    return dataTopic;
  }

  List<DataTopic> temp = [];
  void getAllTopic() async {
    print('HHHh');
    //TopicModel topics = (await StudyRepo.diogetAllTopic())!;
    temp = (await getTopics())!;
    print('hehe');
    //idTopics = temp.map((e) => e.topicId).toList();
    setState(() {
      for (int i = 0; i < temp.length; i++) {
        if (temp[i].topicId! >= 8) {
          idTopics.add(temp[i].topicId!);
          nameTopics.add(temp[i].content!);
        }
      }
    });
    // for (int i = 0; i < temp.length; i++) {
    //   if (temp[i].topicId! >= 8) {
    //     idTopics.add(temp[i].topicId!);
    //     nameTopics.add(temp[i].content!);
    //   }
    // }
  }

  @override
  void initState() {
    super.initState();
    getAllTopic();
    // controller.getData();
    // controller.stateNotifier.addListener(() {
    //   setState(() {});
    // });
    print(nameTopics);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    //QuestionBloc fetch = BlocProvider.of<QuestionBloc>(context);
    //fetch.add(FetchQuestion());
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
                    children: List.generate(3, (index) {
                      return nameTopics.length != 0
                          ? InkWell(
                              child: QuizCardWidget(
                                  title:
                                      //'hehee',
                                      nameTopics.length != 0
                                          ? nameTopics[index]
                                          : 'hehe',
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
                                      builder: (contex) => LoadPage(
                                        topicId: idTopics[index],
                                      ),
                                    ));
                              },
                            )
                          : CircularProgressIndicator();
                    })
                    // [
                    //   BlocBuilder<QuestionBloc, QuestionState>(
                    //       builder: (context, state) {
                    //     if (state is QuestionLoading) {
                    //       return const CircularProgressIndicator();
                    //     } else if (state is QuestionLoaded) {
                    //       Data a = state.data.data![0];
                    //       return InkWell(
                    //         child: QuizCardWidget(
                    //             title: 'Chữ cái',
                    //             onTap: () {
                    //               // Navigator.push(
                    //               //     context,
                    //               //     MaterialPageRoute(
                    //               //       builder: (contex) => ChallengePage(
                    //               //         questions: state.data,
                    //               //         title: state.data.message!,
                    //               //       ),
                    //               //     ));
                    //             },
                    //             size: size),
                    //         onTap: () {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                 builder: (contex) => ChallengePage(
                    //                   questions: state.data,
                    //                   title: state.data.message!,
                    //                 ),
                    //               ));
                    //         },
                    //       );
                    //     } else
                    //       return Text('data');
                    //   }),

                    // ]
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
