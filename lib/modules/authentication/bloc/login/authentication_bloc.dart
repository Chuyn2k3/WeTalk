import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_app/data/term/app_term.dart';
import 'package:flutter_app/modules/authentication/bloc/login/authentication_bloc_event.dart';
import 'package:flutter_app/modules/authentication/bloc/login/authentication_bloc_state.dart';
import 'package:flutter_app/modules/authentication/model/login_model.dart';
import 'package:flutter_app/modules/authentication/repo/authentication_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>(
      (event, emit) async {
        if (event is FetchLogin) {
          String email = event.email;
          String password = event.password;     
          emit(AuthenticationLoading());
          try {        
            // final connectivityResult =
            //     await (Connectivity().checkConnectivity());
            // if (connectivityResult == ConnectivityResult.wifi ||
            //     connectivityResult == ConnectivityResult.mobile) {
            LoginDataModel? data =
                await AuhthenticationRepo.diologin(email, password);

            if (data!.accessToken != null) {
              emit(AuthenticationLoaded(data: data));
            } else {
              emit(AuthenticationError());
            }
            // } else {
            //   emit(AuthenticationErrorConnectivity(
            //       error: AppLoginTerm.notConnectivityWifi));
            // }
          } catch (e) {
            emit(AuthenticationErrorApi(error: e.toString()));
          }
        }
      },
    );
  }
}
