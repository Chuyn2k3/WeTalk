part of 'list_topic_cubit.dart';

abstract class ListTopicState extends Equatable {
  @override
  List<Object> get props => [];
}

class ListTopicInitialState extends ListTopicState {}

class ListTopicLoadingState extends ListTopicState {}

class ListTopicLoadedState extends ListTopicState {
   final TopicModel lsttopic;
  ListTopicLoadedState({required this.lsttopic});

  @override
  List<Object> get props => [lsttopic];
}

class ListTopicErrorState extends ListTopicState {
  final String error;
  ListTopicErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
