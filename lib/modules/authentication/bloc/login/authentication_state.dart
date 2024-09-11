part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticationLoaded extends AuthenticationState {
  final LoginDataModel data;
  const AuthenticationLoaded({required this.data});
  @override
  List<Object> get props => [data];
}

class AuthenticationError extends AuthenticationState {
  final String error;
  const AuthenticationError({required this.error});
  @override
  List<Object> get props => [error];
}
