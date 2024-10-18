import 'package:flutter/material.dart';
import 'package:flutter_app/modules/study/bloc/list_topic_by_classroom_cubit.dart';
import 'package:flutter_app/modules/study/widget/study/topic_item.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';
import 'package:flutter_app/widget/circular_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({super.key, required this.classroomId});
  final int classroomId;
  @override
  Widget build(BuildContext context) {
    context
        .read<ListTopicByClassroomCubit>()
        .getListTopicByClassroom(classroomId);
    return BaseScaffold(
      appBar: CustomAppbar.basic(
        title: "Chủ đề",
        onTap: () => Navigator.pop(context),
      ),
      body: BlocBuilder<ListTopicByClassroomCubit, ListTopicByClassroomState>(
        builder: (context, state) {
          if (state is ListTopicByClassroomLoadingState) {
            return const Center(child: CircularIndicator());
          }
          if (state is ListTopicByClassroomLoadedState) {
            final topicList = state.lsttopic.data;
            if (topicList != null) {
              return GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 2,
                children: topicList
                    .map((e) => TopicItem(
                          linkImage: e.imageLocation ?? "",
                          topicName: e.content ?? "",
                          topicId: e.topicId ?? 0,
                        ))
                    .toList(),
              );
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
