part of 'request_list_friend_cubit.dart';


abstract class RequestListFriendState extends Equatable {
  const RequestListFriendState();
}

class RequestListFriendInitialState extends RequestListFriendState {
  @override
  List<Object> get props => [];
}

class RequestListFriendLoadingState extends RequestListFriendState {
  @override
  List<Object> get props => [];
}

class RequestListFriendLoadedState extends RequestListFriendState {
   final RequestListFriendModel lstRequestFriend;
  const RequestListFriendLoadedState({required this.lstRequestFriend});

  @override
  List<Object> get props => [lstRequestFriend];
}

class EmptyRequestListFriendState extends RequestListFriendState {
  @override
  List<Object> get props => [];
}

class RequestListFriendErrorState extends RequestListFriendState {
  final String error;
  const RequestListFriendErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
