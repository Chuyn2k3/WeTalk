import 'package:equatable/equatable.dart';
import 'package:flutter_app/modules/search/repository/search_repository.dart';
import 'package:flutter_app/modules/study/model/vocabulary_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "search_vocabulary_by_text_state.dart";

GetIt _sl = GetIt.instance;

class SearchVocabularyByTextCubit extends Cubit<SearchVocabularyByTextState> {
  SearchVocabularyByTextCubit() : super(SearchVocabularyByTextInitialState());
  final SearchRepository _searchRepository = _sl();

  void searchVocabularyByText(String content) async {
    try {
      emit(SearchVocabularyByTextLoadingState());
      final result = await _searchRepository.searchVocabularyByText(content);
      emit(SearchVocabularyByTextLoadedState(vocabularyModel: result));
    } catch (e) {
      emit(SearchVocabularyByTextErrorState(error: e.toString()));
    }
  }
}
