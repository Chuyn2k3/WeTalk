import 'package:flutter/material.dart';
import 'package:flutter_app/modules/authentication/page/register_screen.dart';
import 'package:flutter_app/modules/authentication/page/login_screen.dart';
import 'package:flutter_app/modules/chat/page/fragment_talk_chat.dart';
import 'package:flutter_app/modules/home/page/home_screen.dart.dart';
import 'package:flutter_app/modules/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ChatMainScreen.routeName: (context) => const ChatMainScreen()
};
