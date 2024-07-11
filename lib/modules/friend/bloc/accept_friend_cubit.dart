import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/di/locator.dart';
import 'package:flutter_app/modules/friend/repo/friend_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'accept_friend_state.dart';

class AcceptFriendCubit extends Cubit<AcceptFriendState> {
  AcceptFriendCubit() : super(AcceptFriendInitialState());

  final FriendRepository _friendRepository = serviceLocator<FriendRepository>();

  void acceptFriend(int idFriend) async {
    try {
      emit(AcceptFriendLoadingState());
      final _ = await _friendRepository.acceptFriend(idFriend);
      emit(AcceptFriendLoadedState());
    } on DioException catch (e) {
      emit(AcceptFriendErrorState(error: e.message!));
    }
  }
}
