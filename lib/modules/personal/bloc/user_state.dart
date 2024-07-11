part of 'user_cubit.dart';


abstract class UserInfoState extends Equatable {
  const UserInfoState();
}

class UserInfoInitialState extends UserInfoState {
  @override
  List<Object> get props => [];
}

class UserInfoLoadingState extends UserInfoState {
  @override
  List<Object> get props => [];
}

class UserInfoLoadedState extends UserInfoState {
   final UserModel user;
  const UserInfoLoadedState({required this.user});

  @override
  List<Object> get props => [user];
}

class EmptyUserInfoState extends UserInfoState {
  @override
  List<Object> get props => [];
}

class UserInfoErrorState extends UserInfoState {
  final String error;
  const UserInfoErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
