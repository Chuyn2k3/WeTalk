part of 'list_vocabulary_by_topic_cubit.dart';

abstract class ListVocabularyByTopicState extends Equatable {
  @override
  List<Object> get props => [];
}

class ListVocabularyByTopicInitialState extends ListVocabularyByTopicState {}

class ListVocabularyByTopicLoadingState extends ListVocabularyByTopicState {}

class ListVocabularyByTopicLoadedState extends ListVocabularyByTopicState {
   final VocabularyModel lstvocabulary;
  ListVocabularyByTopicLoadedState({required this.lstvocabulary});

  @override
  List<Object> get props => [lstvocabulary];
}

class ListVocabularyByTopicErrorState extends ListVocabularyByTopicState {
  final String error;
  ListVocabularyByTopicErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
