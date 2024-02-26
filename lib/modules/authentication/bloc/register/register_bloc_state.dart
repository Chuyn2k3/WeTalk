abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterLoaded extends RegisterState {
  // final data;
  // RegisterLoaded({required this.data});
}
class RegisterError extends RegisterState {
  final String error;
  RegisterError({required this.error});
}
class RegisterErrorApi extends RegisterState {
  final String error;
  RegisterErrorApi({required this.error});
}
