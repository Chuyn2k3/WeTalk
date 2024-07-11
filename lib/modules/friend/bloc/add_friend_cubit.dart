import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/di/locator.dart';
import 'package:flutter_app/modules/friend/repo/friend_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'add_friend_state.dart';

class AddFriendCubit extends Cubit<AddFriendState> {
  AddFriendCubit() : super(AddFriendInitialState());

  final FriendRepository _friendRepository = serviceLocator<FriendRepository>();

  void addFriend(int idFriend) async {
    try {
      emit(AddFriendLoadingState());
      final _ = await _friendRepository.addFriend(idFriend);
      emit(AddFriendLoadedState());
    } on DioException catch (e) {
      emit(AddFriendErrorState(error: e.message!));
    }
  }
}
