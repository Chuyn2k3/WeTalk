import 'package:dio/dio.dart';
import 'package:flutter_app/di/locator.dart';
import 'package:flutter_app/modules/friend/model/sending_list_friend_model.dart';
import 'package:flutter_app/modules/friend/repo/friend_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'sending_list_friend_state.dart';

class SendingListFriendCubit extends Cubit<SendingListFriendState> {
  SendingListFriendCubit() : super(SendingListFriendInitialState());

  final FriendRepository _friendRepository = serviceLocator<FriendRepository>();

  void getSendingListFriend() async {
    try {
      emit(SendingListFriendLoadingState());
      final result = await _friendRepository.getSendingListFriend();
      emit(SendingListFriendLoadedState(lstSendingFriend: result));
    } on DioException catch (e) {
      emit(SendingListFriendErrorState(error: e.message!));
    }
  }
}
