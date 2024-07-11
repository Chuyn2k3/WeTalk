import 'package:dio/dio.dart';
import 'package:flutter_app/di/locator.dart';
import 'package:flutter_app/modules/chat/model/list_conversation_model.dart';
import 'package:flutter_app/modules/chat/repo/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
part 'list_conversation_state.dart';
GetIt _sl = GetIt.instance;
class ListConversationCubit extends Cubit<ListConversationState> {
  ListConversationCubit() : super(ListConversationInitialState());

  final ChatRepository _chatRepository = _sl();

  void getListConversation() async {
    try {
      emit(ListConversationLoadingState());
      final result = await _chatRepository.getListConversation();
      emit(ListConversationLoadedState(lstConversation: result));
    } on DioException catch (e) {
      emit(ListConversationErrorState(error: e.message!));
    }
  }
}
