import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/di/locator.dart';
import 'package:flutter_app/modules/home/repo/vocabulary_repo.dart';
import 'package:flutter_app/modules/study/model/vocabulary_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'vocabulary_by_topic_state.dart';

class VocabularyByTopicCubit extends Cubit<VocabularyByTopicState> {
  VocabularyByTopicCubit() : super(VocabularyByTopicInitialState());

  final VocabularyRepository _vocabularyRepository =
      serviceLocator<VocabularyRepository>();

  void vocabularyByTopic() async {
    try {
      emit(VocabularyByTopicLoadingState());
      final result = await _vocabularyRepository.getVocabularyByTopic();

      emit(VocabularyByTopicLoadedState(vocabularyModel: result));
    } on DioException catch (e) {
      emit(VocabularyByTopicErrorState(error: e.message!));
    }
  }
}
