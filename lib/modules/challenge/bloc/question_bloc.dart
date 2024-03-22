import 'package:flutter_app/modules/challenge/bloc/question_bloc_event.dart';
import 'package:flutter_app/modules/challenge/bloc/question_bloc_state.dart';
import 'package:flutter_app/modules/challenge/model/question/question_model.dart';
import 'package:flutter_app/modules/challenge/repo/question_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc() : super(QuestionInitial()) {
    on<QuestionEvent>(
      (event, emit) async{
         if (event is FetchQuestion) {
          // String email = event.email;
          // String password = event.password;     
          emit(QuestionLoading());
          try {        
            // final connectivityResult =
            //     await (Connectivity().checkConnectivity());
            // if (connectivityResult == ConnectivityResult.wifi ||
            //     connectivityResult == ConnectivityResult.mobile) {
            QuestionModel? data =
                await QuestionnRepo.diogetQuestion();

            if (data!.code==200) {
              emit(QuestionLoaded(data: data));
            } else {
              emit(QuestionError());
            }
            // } else {
            //   emit(QuestionErrorConnectivity(
            //       error: AppLoginTerm.notConnectivityWifi));
            // }
          } catch (e) {
            emit(QuestionErrorApi(error: e.toString()));
          }
        }
      },
    );
  }
}
