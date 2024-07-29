import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/study/bloc/list_classroom_cubit.dart';
import 'package:flutter_app/modules/study/page/study/vocabulary_topic.dart';

import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudyTopic extends StatelessWidget {
  const StudyTopic({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BaseScaffold(
        body: BlocBuilder<ListClassroomCubit, ListClassroomState>(
      builder: (context, state) {
        if (state is ListClassroomLoadingState) {
          return const CircularProgressIndicator();
        } else if (state is ListClassroomLoadedState) {
          final listClassroom = state.lsttopic.data;
          if (listClassroom != null) {
            return GridView.count(
              crossAxisCount: 2,
              children: state.lsttopic.data!
                  .map((e) =>
                      classroomItem(e.content ?? "", e.imageLocation ?? "",() => Navigator.push(context, MaterialPageRoute(builder: (context) => TopicScreen(classroomId: e.classRoomId??0,),)),))
                  .toList(),
            );
          }
          return const SizedBox.shrink();
        }
        return const SizedBox.shrink();
      },
    ));
  }

  Widget classroomItem(String nameClassroom, String classroomImage, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        padding: EdgeInsets.all(8),
        child: Column(
          children: [Image.network(classroomImage), Text(nameClassroom)],
        ),
      ),
    );
  }
}
