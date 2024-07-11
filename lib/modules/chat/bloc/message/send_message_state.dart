part of 'send_message_cubit.dart';

abstract class SendMessageState extends Equatable {
  @override
  List<Object> get props => [];
}

class SendMessageInitialState extends SendMessageState {}

class SendMessageLoadingState extends SendMessageState {}

class SendMessageLoadedState extends SendMessageState {}

class SendMessageErrorState extends SendMessageState {
  final String error;
  SendMessageErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
