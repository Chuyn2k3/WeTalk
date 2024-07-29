part of 'vocabulary_by_topic_cubit.dart';

abstract class VocabularyByTopicState extends Equatable {
  const VocabularyByTopicState();
}

class VocabularyByTopicInitialState extends VocabularyByTopicState {
  @override
  List<Object> get props => [];
}

class VocabularyByTopicLoadingState extends VocabularyByTopicState {
  @override
  List<Object> get props => [];
}

class VocabularyByTopicLoadedState extends VocabularyByTopicState {
  final VocabularyModel VocabularyByTopic;
  const VocabularyByTopicLoadedState({required this.VocabularyByTopic});

  @override
  List<Object> get props => [VocabularyByTopic];
}

class EmptyVocabularyByTopicState extends VocabularyByTopicState {
  @override
  List<Object> get props => [];
}

class VocabularyByTopicErrorState extends VocabularyByTopicState {
  final String error;
  const VocabularyByTopicErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
