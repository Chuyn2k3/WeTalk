part of 'accept_friend_cubit.dart';

abstract class AcceptFriendState extends Equatable {
  @override
  List<Object> get props => [];
}

class AcceptFriendInitialState extends AcceptFriendState {}

class AcceptFriendLoadingState extends AcceptFriendState {}

class AcceptFriendLoadedState extends AcceptFriendState {}

class AcceptFriendErrorState extends AcceptFriendState {
  final String error;
  AcceptFriendErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
