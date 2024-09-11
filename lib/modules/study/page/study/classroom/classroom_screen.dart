import 'package:flutter/material.dart';
import 'package:flutter_app/modules/study/bloc/list_classroom_cubit.dart';
import 'package:flutter_app/modules/study/page/study/vocabulary_topic.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/button/base_button.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';
import 'package:flutter_app/widget/circular_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassroomScreen extends StatelessWidget {
  const ClassroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: CustomAppbar.basic(
        title: "Lớp Học",
        onTap: () => Navigator.pop(context),
      ),
      body: BlocBuilder<ListClassroomCubit, ListClassroomState>(
        builder: (context, state) {
          if (state is ListClassroomLoadingState) {
            return const Center(child: CircularIndicator());
          }
          if (state is ListClassroomLoadedState) {
            final data = state.lsttopic.data;
            if (data != null || data!.isNotEmpty) {
              return SingleChildScrollView(
                child: Column(
                  children: data
                      .map((e) => BaseRoundedButton.all(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TopicScreen(classroomId: e.classRoomId??0),
                                ));
                          },
                          margin: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: (e.imageLocation != null &&
                                          e.imageLocation!.isNotEmpty)
                                      ? Image.network(
                                          e.imageLocation!,
                                        )
                                      : Image.asset('assets/image/logo.png')),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Text(
                                e.content ?? "",
                                style: textTheme.t14R,
                              )),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.black26,
                              )
                            ],
                          )))
                      .toList(),
                ),
              );
            } else {
              return const Center(child: Text("Không tìm thấy lớp"));
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
