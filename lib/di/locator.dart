import 'package:flutter_app/modules/chat/bloc/conversation/list_conversation_cubit.dart';
import 'package:flutter_app/modules/chat/repo/chat_repository.dart';
import 'package:flutter_app/modules/friend/bloc/list_friend_cubit.dart';
import 'package:flutter_app/modules/friend/repo/friend_repository.dart';
import 'package:flutter_app/modules/home/repo/vocabulary_repo.dart';
import 'package:flutter_app/modules/personal/bloc/user_cubit.dart';
import 'package:flutter_app/modules/personal/repo/user_repository.dart';
import 'package:flutter_app/modules/study/bloc/question_all_cubit.dart';
import 'package:flutter_app/modules/study/repo/study_repo.dart';
import 'package:flutter_app/utils/navigator_key.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

Future setupLocator() async{
  //serviceLocator
  serviceLocator.registerLazySingleton(() => NavigationService());
  serviceLocator.registerLazySingleton(() => ListFriendCubit());
  serviceLocator.registerLazySingleton(() => ListConversationCubit());
  serviceLocator.registerLazySingleton(() => UserInfoCubit());
  serviceLocator.registerLazySingleton(() => QuestionAllCubit());
  //repository
  serviceLocator.registerFactory<FriendRepository>(
      () => FriendRepositoryImp());
  serviceLocator.registerFactory<ChatRepository>(
      () => ChatRepositoryImp());
  serviceLocator.registerFactory<UserRepository>(
      () => UserRepositoryImp());
  serviceLocator.registerFactory<VocabularyRepository>(
      () => VocabularyRepositoryImp());
   serviceLocator.registerFactory<StudyRepository>(
      () => StudyRepositoryImp());
}