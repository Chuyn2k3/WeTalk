part of 'list_classroom_cubit.dart';

abstract class ListClassroomState extends Equatable {
  @override
  List<Object> get props => [];
}

class ListClassroomInitialState extends ListClassroomState {}

class ListClassroomLoadingState extends ListClassroomState {}

class ListClassroomLoadedState extends ListClassroomState {
   final ClassroomModel lsttopic;
  ListClassroomLoadedState({required this.lsttopic});

  @override
  List<Object> get props => [lsttopic];
}

class ListClassroomErrorState extends ListClassroomState {
  final String error;
  ListClassroomErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
