import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/authentication/bloc/login/authentication_cubit.dart';
import 'package:flutter_app/modules/authentication/widget/input_login.dart';
import 'package:flutter_app/modules/tab_bar/tab_bar.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
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

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
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
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset('assets/image/WeSignLogo.png'),
                  ),
                  const SizedBox(height: 24),
                  InputLogin(
                    passwordController: passController,
                    usernameController: emailController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: const Text(
                      'Hoặc đăng nhập bằng',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  IntrinsicHeight(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainTabbarScreen(),
                            ));
                        // fetchLogin.add(FetchLogin(
                        //     email: "chuyenp32@gmail.com",
                        //     password: "123456789"));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFF5F5F5),
                        ),
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 16, right: 16),
                        margin: const EdgeInsets.only(
                            bottom: 17, left: 22, right: 22),
                        width: double.infinity,
                        child: const Column(
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
    ));
  }

  Widget _textRegister(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: RichText(
          text: TextSpan(children: [
        const TextSpan(
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ));
            },
          style: const TextStyle(
            color: Color(0xFF007aff),
            fontSize: 16,
          ),
        )
      ])),
    );
  }
}
