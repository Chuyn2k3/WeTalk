part of 'list_conversation_cubit.dart';


abstract class ListConversationState extends Equatable {
  const ListConversationState();
}

class ListConversationInitialState extends ListConversationState {
  @override
  List<Object> get props => [];
}

class ListConversationLoadingState extends ListConversationState {
  @override
  List<Object> get props => [];
}

class ListConversationLoadedState extends ListConversationState {
   final ListConversationModel lstConversation;
  const ListConversationLoadedState({required this.lstConversation});

  @override
  List<Object> get props => [lstConversation];
}

class EmptyListConversationState extends ListConversationState {
  @override
  List<Object> get props => [];
}

class ListConversationErrorState extends ListConversationState {
  final String error;
  const ListConversationErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
