import 'package:dio/dio.dart';
import 'package:flutter_app/di/locator.dart';
import 'package:flutter_app/modules/friend/model/request_list_friend-model.dart';
import 'package:flutter_app/modules/friend/repo/friend_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'request_list_friend_state.dart';

class RequestListFriendCubit extends Cubit<RequestListFriendState> {
  RequestListFriendCubit() : super(RequestListFriendInitialState());

  final FriendRepository _friendRepository = serviceLocator<FriendRepository>();

  void getRequestListFriend() async {
    try {
      emit(RequestListFriendLoadingState());
      final result = await _friendRepository.getRequestListFriend();
      emit(RequestListFriendLoadedState(lstRequestFriend: result));
    } on DioException catch (e) {
      emit(RequestListFriendErrorState(error: e.message!));
    }
  }
}
