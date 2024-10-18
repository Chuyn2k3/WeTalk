import 'package:dio/dio.dart';
import 'package:flutter_app/modules/friend/model/list_friend_model.dart';
import 'package:flutter_app/modules/friend/repo/friend_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
part 'list_friend_state.dart';
GetIt _sl = GetIt.instance;
class ListFriendCubit extends Cubit<ListFriendState> {
  ListFriendCubit() : super(ListFriendInitialState());

  final FriendRepository _friendRepository = _sl();

  void getListFriend() async {
    try {
      emit(ListFriendLoadingState());
      final result = await _friendRepository.getListFriend();
      emit(ListFriendLoadedState(lstFriend: result));
    } on DioException catch (e) {
      emit(ListFriendErrorState(error: e.message!));
    }
  }
}
