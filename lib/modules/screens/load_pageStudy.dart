import 'package:flutter/material.dart';
import 'package:flutter_app/modules/challenge/bloc/question_bloc.dart';
import 'package:flutter_app/modules/challenge/bloc/question_bloc_event.dart';
import 'package:flutter_app/modules/challenge/bloc/question_bloc_state.dart';
import 'package:flutter_app/modules/challenge/challenge_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({super.key, required this.topicId});
  final int topicId;
  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  QuestionBloc fetchQuestion = QuestionBloc();

  @override
  Widget build(BuildContext context) {
    fetchQuestion.add(FetchQuestion(idTopic: widget.topicId.toString()));
    return Scaffold(
      body: BlocConsumer(
        bloc: fetchQuestion,
        builder: (context, state) {
          if (state is QuestionLoading) {
            return CircularProgressIndicator();
          } else if (state is QuestionError) {
            return Text('error');
          } else
            return SizedBox();
        },
        listener: (context, state) {
          if (state is QuestionLoaded) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contex) => ChallengePage(
                    questions: state.data,
                    title: state.data.message!,
                  ),
                ));
          }
        },
      ),
    );
  }
}
