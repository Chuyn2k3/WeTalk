import 'package:flutter/material.dart';
import 'package:flutter_app/modules/challenge/challenge_page.dart';
import 'package:flutter_app/modules/study/bloc/question_all_cubit.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllQuestionScreen extends StatefulWidget {
  const AllQuestionScreen({super.key});

  @override
  State<AllQuestionScreen> createState() => _AllQuestionScreenState();
}

class _AllQuestionScreenState extends State<AllQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: BlocBuilder<QuestionAllCubit, QuestionAllState>(
        builder: (context, state) {
          if (state is QuestionAllLoadedState) {
            return ChallengePage(
                questions: state.lstvocabulary, title: "Rèn luyện từ vựng");
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
