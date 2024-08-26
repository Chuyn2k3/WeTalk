import 'package:flutter/material.dart';
import 'package:flutter_app/di/locator.dart';
import 'package:flutter_app/modules/authentication/bloc/login/authentication_bloc.dart';
import 'package:flutter_app/modules/challenge/bloc/question_bloc.dart';
import 'package:flutter_app/modules/chat/bloc/conversation/list_conversation_cubit.dart';
import 'package:flutter_app/modules/friend/bloc/list_friend_cubit.dart';
import 'package:flutter_app/modules/home/bloc/vocabulary_by_topic_cubit.dart';
import 'package:flutter_app/modules/personal/bloc/user_cubit.dart';
import 'package:flutter_app/modules/screens/splash_screen.dart';
import 'package:flutter_app/modules/study/bloc/list_classroom_cubit.dart';
import 'package:flutter_app/modules/study/bloc/list_topic_by_classroom_cubit.dart';
import 'package:flutter_app/modules/study/bloc/list_topic_cubit.dart';
import 'package:flutter_app/modules/study/bloc/list_vocabulary_by_topic_cubit.dart';
import 'package:flutter_app/modules/study/bloc/question_all_cubit.dart';
import 'package:flutter_app/modules/study/bloc/question_by_classroom_cubit.dart';
import 'package:flutter_app/modules/upload/bloc/ai_detection_cubit.dart';
import 'package:flutter_app/modules/upload/bloc/create_upload_cubit.dart';
import 'package:flutter_app/modules/upload/bloc/get_url_cubit.dart';
import 'package:flutter_app/modules/upload/bloc/history_upload_data_cubit.dart';
import 'package:flutter_app/service/routes.dart';
import 'package:flutter_app/utils/navigator_key.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthenticationBloc>(
      create: (BuildContext context) => AuthenticationBloc(),
    ),
    
    BlocProvider<ListFriendCubit>(
      create: (BuildContext context) => ListFriendCubit()..getListFriend(),
    ),
    BlocProvider<ListConversationCubit>(
      create: (BuildContext context) =>
          ListConversationCubit()..getListConversation(),
    ),
    BlocProvider<UserInfoCubit>(
      create: (BuildContext context) => UserInfoCubit()..getUserInfo(),
    ),
    BlocProvider<VocabularyByTopicCubit>(
      create: (BuildContext context) =>
          VocabularyByTopicCubit()..vocabularyByTopic(),
    ),
   BlocProvider<ListClassroomCubit>(
      create: (BuildContext context) =>
          ListClassroomCubit()..getListClassroom(),
    ),
    BlocProvider<ListTopicByClassroomCubit>(
      create: (BuildContext context) =>
          ListTopicByClassroomCubit(),
    ),
    BlocProvider<ListTopicCubit>(
      create: (BuildContext context) =>
          ListTopicCubit()..getListTopic(),
    ),
    BlocProvider<ListVocabularyByTopicCubit>(
      create: (BuildContext context) =>
          ListVocabularyByTopicCubit(),
    ),
    BlocProvider<QuestionAllCubit>(
      create: (BuildContext context) =>
          QuestionAllCubit()..getAllQuestion(),
    ),
    BlocProvider<QuestionByClassroomCubit>(
      create: (BuildContext context) =>
          QuestionByClassroomCubit(),
    ),
    BlocProvider<CreateUploadCubit>(
      create: (BuildContext context) =>
          CreateUploadCubit(),
    ),
    BlocProvider<GetUrlCubit>(
      create: (BuildContext context) =>
          GetUrlCubit(),
    ),
    BlocProvider<AiDetectionCubit>(
      create: (BuildContext context) =>
          AiDetectionCubit(),
    ),
    BlocProvider<UploadHistoryCubit>(
      create: (BuildContext context) =>
          UploadHistoryCubit(),
    ),
  ], child: const MyApp()));
}

final navigatorKey = GetIt.instance<NavigationService>().navigatorKey;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
