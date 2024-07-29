import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/modules/study/bloc/list_topic_by_classroom_cubit.dart';
import 'package:flutter_app/modules/study/widget/study/topic_item.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

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
            return const CircularProgressIndicator();
          }
          if (state is ListTopicByClassroomLoadedState) {
            final topicList = state.lsttopic.data;
            if (topicList != null) {
              return GridView.count(
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

  Widget _topicItem(String topicName, String linkImage, int topicId) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        height: 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            linkImage.isNotEmpty ? Image.network(linkImage) : Image.asset(''),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  topicName,
                  style:
                      textTheme.t12M.copyWith(color: AppColors.chartSecondary),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.red,
                  highlightColor: Colors.yellow,
                  child: const Text(
                    "Ấn vào để học từ vựng",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
