import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/di/locator.dart';
import 'package:flutter_app/modules/chat/repo/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit() : super(SendMessageInitialState());

  final ChatRepository _chatRepository = serviceLocator<ChatRepository>();

  void sendMessage(String content,int conversationId,int contactId) async {
    try {
      emit(SendMessageLoadingState());
      final _ = await _chatRepository.sendMessage(content, conversationId, contactId);
      emit(SendMessageLoadedState());
    } on DioException catch (e) {
      emit(SendMessageErrorState(error: e.message!));
    }
  }
}
