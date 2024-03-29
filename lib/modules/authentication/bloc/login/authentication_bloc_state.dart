import 'package:flutter_app/modules/authentication/model/login_model.dart';

abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationLoaded extends AuthenticationState {
  final LoginDataModel data;
  AuthenticationLoaded({required this.data});
}

class AuthenticationError extends AuthenticationState {}

class AuthenticationErrorApi extends AuthenticationState {
  final String error;
  AuthenticationErrorApi({required this.error});
}

class AuthenticationErrorConnectivity extends AuthenticationState {
  String error;
  AuthenticationErrorConnectivity({required this.error});
}
