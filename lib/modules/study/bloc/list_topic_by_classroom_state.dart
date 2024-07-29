part of 'list_topic_by_classroom_cubit.dart';

abstract class ListTopicByClassroomState extends Equatable {
  @override
  List<Object> get props => [];
}

class ListTopicByClassroomInitialState extends ListTopicByClassroomState {}

class ListTopicByClassroomLoadingState extends ListTopicByClassroomState {}

class ListTopicByClassroomLoadedState extends ListTopicByClassroomState {
   final TopicModel lsttopic;
  ListTopicByClassroomLoadedState({required this.lsttopic});

  @override
  List<Object> get props => [lsttopic];
}

class ListTopicByClassroomErrorState extends ListTopicByClassroomState {
  final String error;
  ListTopicByClassroomErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
