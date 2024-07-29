import 'package:flutter/material.dart';
import 'package:flutter_app/modules/challenge/challenge_page.dart';
import 'package:flutter_app/modules/study/bloc/question_all_cubit.dart';
import 'package:flutter_app/modules/study/bloc/question_by_classroom_cubit.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionByClassroomIdScreen extends StatefulWidget {
  const QuestionByClassroomIdScreen({super.key, required this.classroomId});
  final int classroomId;
  @override
  State<QuestionByClassroomIdScreen> createState() =>
      _QuestionByClassroomIdScreenState();
}

class _QuestionByClassroomIdScreenState
    extends State<QuestionByClassroomIdScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<QuestionByClassroomCubit>().getQuestionByClassroomn(widget.classroomId);
    return BaseScaffold(
      body: BlocBuilder<QuestionByClassroomCubit, QuestionByClassroomState>(
        builder: (context, state) {
          if (state is QuestionByClassroomLoadedState) {
            return ChallengePage(
                questions: state.lstvocabulary, title: "Rèn luyện từ vựng");
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
