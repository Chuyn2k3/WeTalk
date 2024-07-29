import 'package:dio/dio.dart';
import 'package:flutter_app/modules/study/model/vocabulary_model.dart';
import 'package:flutter_app/modules/study/repo/study_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
part 'list_vocabulary_by_topic_state.dart';
GetIt _sl = GetIt.instance;
class ListVocabularyByTopicCubit extends Cubit<ListVocabularyByTopicState> {
  ListVocabularyByTopicCubit() : super(ListVocabularyByTopicInitialState());

  final StudyRepository _studyRepository  = _sl();

  void getListVocabularyByTopic(int topicId) async {
    try {
      emit(ListVocabularyByTopicLoadingState());
      final result = await  _studyRepository.getListVocabularyByTopicId(topicId);
      emit(ListVocabularyByTopicLoadedState(lstvocabulary: result));
    } on DioException catch (e) {
      emit(ListVocabularyByTopicErrorState(error: e.message!));
    }
  }
}
