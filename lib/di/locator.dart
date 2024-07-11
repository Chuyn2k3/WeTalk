import 'package:flutter_app/modules/chat/bloc/conversation/list_conversation_cubit.dart';
import 'package:flutter_app/modules/chat/repo/chat_repository.dart';
import 'package:flutter_app/modules/friend/bloc/list_friend_cubit.dart';
import 'package:flutter_app/modules/friend/repo/friend_repository.dart';
import 'package:flutter_app/modules/personal/bloc/user_cubit.dart';
import 'package:flutter_app/modules/personal/repo/user_repository.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

Future setupLocator() async{
  //serviceLocator
  serviceLocator.registerLazySingleton(() => ListFriendCubit());
  serviceLocator.registerLazySingleton(() => ListConversationCubit());
  serviceLocator.registerLazySingleton(() => UserInfoCubit());
  //repository
  serviceLocator.registerFactory<FriendRepository>(
      () => FriendRepositoryImp());
  serviceLocator.registerFactory<ChatRepository>(
      () => ChatRepositoryImp());
  serviceLocator.registerFactory<UserRepository>(
      () => UserRepositoryImp());
}