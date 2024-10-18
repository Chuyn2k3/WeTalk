import 'package:dio/dio.dart';
import 'package:flutter_app/modules/study/model/topic_model.dart';
import 'package:flutter_app/modules/study/repo/study_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
part 'list_topic_by_classroom_state.dart';
GetIt _sl = GetIt.instance;
class ListTopicByClassroomCubit extends Cubit<ListTopicByClassroomState> {
  ListTopicByClassroomCubit() : super(ListTopicByClassroomInitialState());

  final StudyRepository _studyRepository  = _sl();

  void getListTopicByClassroom(int classroomId) async {
    try {
      emit(ListTopicByClassroomLoadingState());
      final result = await  _studyRepository.getListTopicByClassroom(classroomId);
      emit(ListTopicByClassroomLoadedState(lsttopic: result));
    } on DioException catch (e) {
      emit(ListTopicByClassroomErrorState(error: e.message!));
    }
  }
}
