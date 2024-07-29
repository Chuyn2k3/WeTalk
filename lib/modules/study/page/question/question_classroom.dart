import 'package:flutter/material.dart';
import 'package:flutter_app/modules/study/bloc/list_classroom_cubit.dart';
import 'package:flutter_app/modules/study/bloc/question_by_classroom_cubit.dart';
import 'package:flutter_app/modules/study/page/question/question_by_classroom_id.dart';
import 'package:flutter_app/modules/study/page/study/vocabulary_topic.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/button/base_button.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionClassroomScreen extends StatelessWidget {
  const QuestionClassroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: CustomAppbar.basic(
        title: "Lớp Học",
        onTap: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<ListClassroomCubit, ListClassroomState>(
          builder: (context, state) {
            if (state is ListClassroomLoadedState) {
              return Column(
                children: state.lsttopic.data!
                    .map((e) => BaseRoundedButton.all(
                        onTap: () {
                          context.read<QuestionByClassroomCubit>().getQuestionByClassroomn(e.classRoomId!);
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => QuestionByClassroomIdScreen(classroomId: e.classRoomId!),));
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
                                child: Image.network(
                                  e.imageLocation!,
                                )),
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
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
