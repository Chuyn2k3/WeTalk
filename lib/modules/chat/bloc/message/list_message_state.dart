part of 'list_message_cubit.dart';


abstract class ListMessageState extends Equatable {
  const ListMessageState();
}

class ListMessageInitialState extends ListMessageState {
  @override
  List<Object> get props => [];
}

class ListMessageLoadingState extends ListMessageState {
  @override
  List<Object> get props => [];
}

class ListMessageLoadedState extends ListMessageState {
   final MessageModel lstMessage;
  const ListMessageLoadedState({required this.lstMessage});

  @override
  List<Object> get props => [lstMessage];
}

class EmptyListMessageState extends ListMessageState {
  @override
  List<Object> get props => [];
}

class ListMessageErrorState extends ListMessageState {
  final String error;
  const ListMessageErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
