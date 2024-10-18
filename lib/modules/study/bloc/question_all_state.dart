part of 'question_all_cubit.dart';

abstract class QuestionAllState extends Equatable {
  @override
  List<Object> get props => [];
}

class QuestionAllInitialState extends QuestionAllState {}

class QuestionAllLoadingState extends QuestionAllState {}

class QuestionAllLoadedState extends QuestionAllState {
   final QuestionStudyModel lstvocabulary;
  QuestionAllLoadedState({required this.lstvocabulary});

  @override
  List<Object> get props => [lstvocabulary];
}

class QuestionAllErrorState extends QuestionAllState {
  final String error;
  QuestionAllErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
