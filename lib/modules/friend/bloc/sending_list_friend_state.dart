part of 'sending_list_friend_cubit.dart';

abstract class SendingListFriendState extends Equatable {
  const SendingListFriendState();
}

class SendingListFriendInitialState extends SendingListFriendState {
  @override
  List<Object> get props => [];
}

class SendingListFriendLoadingState extends SendingListFriendState {
  @override
  List<Object> get props => [];
}

class SendingListFriendLoadedState extends SendingListFriendState {
  final SendingListFriendModel lstSendingFriend;
  const SendingListFriendLoadedState({required this.lstSendingFriend});

  @override
  List<Object> get props => [lstSendingFriend];
}

class EmptySendingListFriendState extends SendingListFriendState {
  @override
  List<Object> get props => [];
}

class SendingListFriendErrorState extends SendingListFriendState {
  final String error;
  const SendingListFriendErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
