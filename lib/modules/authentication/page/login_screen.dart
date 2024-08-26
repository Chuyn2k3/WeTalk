import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/data/term/app_term.dart';
import 'package:flutter_app/data/term/study_link_image.dart';
import 'package:flutter_app/data/term/text_style.dart';

import 'package:flutter_app/modules/authentication/bloc/login/authentication_bloc.dart';
import 'package:flutter_app/modules/authentication/bloc/login/authentication_bloc_event.dart';
import 'package:flutter_app/modules/authentication/bloc/login/authentication_bloc_state.dart';
import 'package:flutter_app/modules/authentication/widget/input_login.dart';
import 'package:flutter_app/modules/tab_bar/tab_bar.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/page/home_screen.dart.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "login_screen";
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passController = TextEditingController();
  bool passToggle = false;
  AuthenticationBloc fetchLogin = AuthenticationBloc();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BaseScaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Container(
                      width: 150,
                      height: 150,
                      child: Image.asset('assets/image/WeSignLogo.png'),
                    ),
                    const SizedBox(height: 24),
                    InputLogin(
                      passwordController: passController,
                      usernameController: emailController,
                      fetchLogin: fetchLogin,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 24),
                      child: Text(
                        'Hoặc đăng nhập bằng',
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    IntrinsicHeight(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFF5F5F5),
                        ),
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 16, right: 16),
                        margin:
                            EdgeInsets.only(bottom: 17, left: 22, right: 22),
                        //width: double.infinity,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  width: 25,
                                  height: 25,
                                  child: Image.asset(
                                    'assets/image/google.png',
                                    fit: BoxFit.fill,
                                  )),
                              //SizedBox(width: 8,),
                              Text(
                                'Đăng nhập với tài khoản Google',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox()
                            ]),
                      ),
                    ),
                    IntrinsicHeight(
                      child: InkWell(
                        onTap: () {
                          fetchLogin.add(FetchLogin(
                              email: "chuyenp32@gmail.com",
                              password: "123456789"));
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => MainTabbarScreen(),
                          //     ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFF5F5F5),
                          ),
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10, left: 16, right: 16),
                          margin:
                              EdgeInsets.only(bottom: 17, left: 22, right: 22),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Text(
                                'Đăng nhập Khách',
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    _textRegister(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
          ),
    );
  }

  Widget _textRegister(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: RichText(
          text: TextSpan(
              //style: textTheme.t16R.copyWith(color: colorApp.blue),
              children: [
            TextSpan(
              text: "Chưa có tài khoản?",
              style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 16,
              ),
            ),
            const TextSpan(
              text: '  ',
            ),
            TextSpan(
              text: "Đăng kí",
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  //GoRouter.of(context).push(RouteUri.register);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ));
                },
              style: TextStyle(
                color: Color(0xFF007aff),
                fontSize: 16,
              ),
            )
          ])),
    );
  }
}
