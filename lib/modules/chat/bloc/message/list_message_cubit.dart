import 'package:dio/dio.dart';
import 'package:flutter_app/di/locator.dart';
import 'package:flutter_app/modules/chat/model/messaage_model.dart';
import 'package:flutter_app/modules/chat/repo/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
part 'list_message_state.dart';
GetIt _sl = GetIt.instance;
class ListMessageCubit extends Cubit<ListMessageState> {
  ListMessageCubit() : super(ListMessageInitialState());

  final ChatRepository _chatRepository = _sl();

  void getListMessage(int conversationId) async {
    try {
      emit(ListMessageLoadingState());
      final result = await _chatRepository.getMessage(conversationId);
      emit(ListMessageLoadedState(lstMessage: result));
    } on DioException catch (e) {
      emit(ListMessageErrorState(error: e.message!));
    }
  }
}
