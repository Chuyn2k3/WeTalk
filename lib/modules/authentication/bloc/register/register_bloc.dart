import 'package:flutter_app/modules/authentication/bloc/register/register_bloc_event.dart';
import 'package:flutter_app/modules/authentication/bloc/register/register_bloc_state.dart';
import 'package:flutter_app/modules/authentication/model/resgister_model.dart';
import 'package:flutter_app/modules/authentication/repo/registe_generate_otp_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>(
      (event, emit) async {
        if (event is FetchRegister) {
          String name = event.name;
          String email = event.email;
          String password = event.password;
          String gender = event.gender;
          String phone = event.phone;
          String address = event.address;
          int age = event.age;
          emit(RegisterLoading());
          try {
            ResgisterModel? data =await RegisterGenerateOtpRepo.dioRegisterGenerateOtp(
                name, email, password, phone, address, gender, age);
            if(data != null){
              if(data.code == 404){
                emit(RegisterError(error: 'Email đã tồn tại'));
              }
              else {
                emit(RegisterLoaded());
              }
            }
          } catch (e) {
            emit(RegisterErrorApi(error: e.toString()));
          }
        }
      },
    );
  }
}
