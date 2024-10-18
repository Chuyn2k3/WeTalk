import 'package:dio/dio.dart';
import 'package:flutter_app/modules/study/model/topic_model.dart';
import 'package:flutter_app/modules/study/repo/study_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
part 'list_topic_state.dart';

GetIt _sl = GetIt.instance;

class ListTopicCubit extends Cubit<ListTopicState> {
  ListTopicCubit() : super(ListTopicInitialState());

  final StudyRepository _studyRepository = _sl();

  void getListTopic() async {
    try {
      emit(ListTopicLoadingState());
      final result = await _studyRepository.getListTopic();
      emit(ListTopicLoadedState(lsttopic: result));
    } on DioException catch (e) {
      emit(ListTopicErrorState(error: e.message!));
    }
  }
}
