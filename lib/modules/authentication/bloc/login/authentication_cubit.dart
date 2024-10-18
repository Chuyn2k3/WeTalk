import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/modules/authentication/model/login_model.dart';
import 'package:flutter_app/modules/authentication/repo/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  void login(String email, String password) async {
    try {
      emit(AuthenticationLoading());
      final result = await AuhthenticationRepo.diologin(email, password);
      emit(AuthenticationLoaded(data: result));
    } on DioException catch (e) {
      emit(AuthenticationError(error: e.message!));
    }
  }
}
