part of 'question_by_classroom_cubit.dart';

abstract class QuestionByClassroomState extends Equatable {
  @override
  List<Object> get props => [];
}

class QuestionByClassroomInitialState extends QuestionByClassroomState {}

class QuestionByClassroomLoadingState extends QuestionByClassroomState {}

class QuestionByClassroomLoadedState extends QuestionByClassroomState {
   final QuestionStudyModel lstvocabulary;
  QuestionByClassroomLoadedState({required this.lstvocabulary});

  @override
  List<Object> get props => [lstvocabulary];
}

class QuestionByClassroomErrorState extends QuestionByClassroomState {
  final String error;
  QuestionByClassroomErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
