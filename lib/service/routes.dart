import 'package:flutter/material.dart';
import 'package:flutter_app/modules/authentication/page/otp_screen.dart';
import 'package:flutter_app/modules/authentication/page/register_screen.dart';
import 'package:flutter_app/modules/authentication/page/login_screen.dart';
import 'package:flutter_app/modules/challenge/challenge_page.dart';
import 'package:flutter_app/modules/chat/page/fragment_talk_chat.dart';
import 'package:flutter_app/modules/chat/page/fragment_talk_chat_home.dart';
import 'package:flutter_app/modules/home/page/home_screen.dart.dart';
import 'package:flutter_app/modules/screens/splash_screen.dart';
import 'package:flutter_app/modules/study/page/exam.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ChatMainScreen.routeName: (context) => const ChatMainScreen(),
  ChatScreen.routeName: (context) => const ChatScreen(),
  //ExamPage.routeName: (context) => const ExamPage(),
  // ErrorScreen.routeName: (context) => const ErrorScreen(),
  // InfoScreen.routeName: (context) => const InfoScreen(),
  // MyhomeScreen.routeName: (context) => const MyhomeScreen(),
  // SettingScreen.routeName: (context) => const SettingScreen(),
  // DepartmentScreen.routeName: (context) => const DepartmentScreen(),
  // NotificationScreen.routeName: (context) => const NotificationScreen(),
  // EmployeeScreen.routeName: (context) => const EmployeeScreen(),
  // StatisticScreen.routeName: (context) => const StatisticScreen(),
  // InventoryScreen.routeName: (context) => const InventoryScreen(),
  // QRScreen.routeName: (context) => const QRScreen(),
};
