part of 'add_friend_cubit.dart';

abstract class AddFriendState extends Equatable {
  @override
  List<Object> get props => [];
}

class AddFriendInitialState extends AddFriendState {}

class AddFriendLoadingState extends AddFriendState {}

class AddFriendLoadedState extends AddFriendState {}

class AddFriendErrorState extends AddFriendState {
  final String error;
  AddFriendErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
