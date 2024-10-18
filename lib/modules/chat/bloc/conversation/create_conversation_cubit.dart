import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/di/locator.dart';
import 'package:flutter_app/modules/chat/repo/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'create_conversation_state.dart';

class CreateConversationCubit extends Cubit<CreateConversationState> {
  CreateConversationCubit() : super(CreateConversationInitialState());

  final ChatRepository _chatRepository = serviceLocator<ChatRepository>();

  void createConversation(int contactId) async {
    try {
      emit(CreateConversationLoadingState());
      final _ = await _chatRepository.createConversation(contactId);
      emit(CreateConversationLoadedState());
    } on DioException catch (e) {
      emit(CreateConversationErrorState(error: e.message!));
    }
  }
}
