import 'package:flutter_app/data/term/app_term.dart';
import 'package:flutter_app/modules/authentication/bloc/otp/otp_bloc_event.dart';
import 'package:flutter_app/modules/authentication/bloc/otp/otp_bloc_state.dart';
import 'package:flutter_app/modules/authentication/model/otp_model.dart';
import 'package:flutter_app/modules/authentication/repo/otp_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpBloc
    extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpInitial()) {
    on<OtpEvent>(
      (event, emit) async {
        if (event is FetchOtp) {
          String email = event.email;
          int otp = event.otp;       
          emit(OtpLoading());
          try {
            // final connectivityResult =
            //     await (Connectivity().checkConnectivity());
            // if (connectivityResult == ConnectivityResult.wifi ||
            //     connectivityResult == ConnectivityResult.mobile) {
            OtpModel? data =
              await OtpRepo.dioOtp(email, otp);  

            if (data != null) {
              emit(OtpLoaded(data: data));
            } else {
              emit(OtpError(error:AppLoginTerm.apiError));
            }
            // } else {
            //   emit(OtpErrorConnectivity(
            //       error: AppLoginTerm.notConnectivityWifi));
            // }
          } catch (e) {
            emit(OtpErrorApi(error: e.toString()));
          }
        }
      },
    );
  }
}
