part of 'create_conversation_cubit.dart';

abstract class CreateConversationState extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateConversationInitialState extends CreateConversationState {}

class CreateConversationLoadingState extends CreateConversationState {}

class CreateConversationLoadedState extends CreateConversationState {}

class CreateConversationErrorState extends CreateConversationState {
  final String error;
  CreateConversationErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
