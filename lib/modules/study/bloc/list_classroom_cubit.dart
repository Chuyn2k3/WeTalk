import 'package:dio/dio.dart';
import 'package:flutter_app/modules/study/model/classroom_model.dart';
import 'package:flutter_app/modules/study/repo/study_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
part 'list_classroom_state.dart';
GetIt _sl = GetIt.instance;
class ListClassroomCubit extends Cubit<ListClassroomState> {
  ListClassroomCubit() : super(ListClassroomInitialState());

  final StudyRepository _studyRepository  = _sl();

  void getListClassroom() async {
    try {
      emit(ListClassroomLoadingState());
      final result = await  _studyRepository.getListClassroom();
      emit(ListClassroomLoadedState(lsttopic: result));
    } on DioException catch (e) {
      emit(ListClassroomErrorState(error: e.message!));
    }
  }
}
