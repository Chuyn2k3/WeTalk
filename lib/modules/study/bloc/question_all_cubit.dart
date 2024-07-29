import 'package:dio/dio.dart';
import 'package:flutter_app/modules/study/model/vocabulary_model.dart';
import 'package:flutter_app/modules/study/model/question_model.dart';
import 'package:flutter_app/modules/study/repo/study_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
part 'question_all_state.dart';
GetIt _sl = GetIt.instance;
class QuestionAllCubit extends Cubit<QuestionAllState> {
  QuestionAllCubit() : super(QuestionAllInitialState());

  final StudyRepository _studyRepository  = _sl();

  void getAllQuestion() async {
    try {
      emit(QuestionAllLoadingState());
      final result = await  _studyRepository.getAllQuestion();
      emit(QuestionAllLoadedState(lstvocabulary: result));
    } on DioException catch (e) {
      emit(QuestionAllErrorState(error: e.message!));
    }
  }
}
