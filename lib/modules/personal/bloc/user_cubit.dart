import 'package:dio/dio.dart';
import 'package:flutter_app/di/locator.dart';
import 'package:flutter_app/modules/chat/model/list_conversation_model.dart';
import 'package:flutter_app/modules/chat/repo/chat_repository.dart';
import 'package:flutter_app/modules/personal/model/user_model.dart';
import 'package:flutter_app/modules/personal/repo/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
part 'user_state.dart';

GetIt _sl = GetIt.instance;

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(UserInfoInitialState());

  final UserRepository _userRepository = _sl();

  void getUserInfo() async {
    try {
      emit(UserInfoLoadingState());
      print("ok");
      final result = await _userRepository.getUserInfo();
      emit(UserInfoLoadedState(user: result));
      print("user ok");
    } on DioException catch (e) {
      emit(UserInfoErrorState(error: e.message!));
    }
  }
}
