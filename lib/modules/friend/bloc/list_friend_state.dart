part of 'list_friend_cubit.dart';


abstract class ListFriendState extends Equatable {
  const ListFriendState();
}

class ListFriendInitialState extends ListFriendState {
  @override
  List<Object> get props => [];
}

class ListFriendLoadingState extends ListFriendState {
  @override
  List<Object> get props => [];
}

class ListFriendLoadedState extends ListFriendState {
   final ListFriendModel lstFriend;
  const ListFriendLoadedState({required this.lstFriend});

  @override
  List<Object> get props => [lstFriend];
}

class EmptyListFriendState extends ListFriendState {
  @override
  List<Object> get props => [];
}

class ListFriendErrorState extends ListFriendState {
  final String error;
  const ListFriendErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
