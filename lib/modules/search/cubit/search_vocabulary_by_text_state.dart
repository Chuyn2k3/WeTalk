part of 'search_vocabulary_by_text_cubit.dart';


class SearchVocabularyByTextState extends Equatable{
  const SearchVocabularyByTextState();
  @override
  List<Object> get props =>[];
}

class SearchVocabularyByTextInitialState extends SearchVocabularyByTextState{
  @override
  List<Object> get props =>[];
}

class SearchVocabularyByTextLoadingState extends SearchVocabularyByTextState{
  @override
  List<Object> get props =>[];
}

class SearchVocabularyByTextLoadedState extends SearchVocabularyByTextState{
  final VocabularyModel vocabularyModel;
  const SearchVocabularyByTextLoadedState({required this.vocabularyModel});
  @override
  List<Object> get props =>[vocabularyModel];
}
class SearchVocabularyByTextErrorState extends SearchVocabularyByTextState{
  final String error;
  const SearchVocabularyByTextErrorState({required this.error});
  @override
  List<Object> get props =>[error];
}
