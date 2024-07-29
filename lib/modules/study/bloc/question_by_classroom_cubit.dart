import 'package:dio/dio.dart';
import 'package:flutter_app/modules/study/model/vocabulary_model.dart';
import 'package:flutter_app/modules/study/model/question_model.dart';
import 'package:flutter_app/modules/study/repo/study_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
part 'question_by_classroom_state.dart';
GetIt _sl = GetIt.instance;
class QuestionByClassroomCubit extends Cubit<QuestionByClassroomState> {
  QuestionByClassroomCubit() : super(QuestionByClassroomInitialState());

  final StudyRepository _studyRepository  = _sl();

  void getQuestionByClassroomn(int classroomId) async {
    try {
      emit(QuestionByClassroomLoadingState());
      final result = await  _studyRepository.getQuestionByClassroom(classroomId);
      emit(QuestionByClassroomLoadedState(lstvocabulary: result));
    } on DioException catch (e) {
      emit(QuestionByClassroomErrorState(error: e.message!));
    }
  }
}
