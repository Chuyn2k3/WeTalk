import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_term.dart';
import 'package:flutter_app/data/term/study_link_image.dart';
import 'package:flutter_app/data/term/text_style.dart';

import 'package:flutter_app/modules/authentication/bloc/login/authentication_bloc.dart';
import 'package:flutter_app/modules/authentication/bloc/login/authentication_bloc_event.dart';
import 'package:flutter_app/modules/authentication/bloc/login/authentication_bloc_state.dart';
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
  final formfield = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passController = TextEditingController();
  bool passToggle = false;
  AuthenticationBloc fetchLogin = AuthenticationBloc();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Form(
          key: formfield,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.38,
                  child: Image.asset(AppLinkImage.topBackground),
                ),
                 Padding(
                  padding: EdgeInsets.only(left: size.width * 0.02),
                  child: Text(
                    AppTexts.welcome,
                    style: AppTextStyles.welcome
                  ),
                ),
                Padding(
                  padding:
                       EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.width * 0.06),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      hintText: AppLoginTerm.email,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      bool emailVaild = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if (value.isEmpty) {
                        return AppLoginTerm.requireEmail;
                      } else if (!emailVaild) {
                        return AppLoginTerm.incorectEmail;
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: TextFormField(

                    obscureText: passToggle,
                    controller: passController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(

                        hintText: AppLoginTerm.password,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Icon(passToggle
                              ? Icons.visibility
                              : Icons.visibility_off),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppLoginTerm.requirePassword;
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: size.width * 0.15,
                  padding: EdgeInsets.only(
                      left: size.width * 0.6), // Dịch SizedBox cách lề phải 30px
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppLinkImage.loginButton),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      iconSize: 60,
                      color: Colors.transparent, // Ẩn IconButton
                      onPressed: () async {
                        if (formfield.currentState!.validate()) {
                          fetchLogin.add(FetchLogin(
                              email: emailController.text,
                              password: passController.text));
                        }
                      },
                    ),
                  ),
                ),
                BlocConsumer<AuthenticationBloc, AuthenticationState>(
                    bloc: fetchLogin,
                    builder: (context, state) {
                      if (state is AuthenticationLoading) {                       
                        return const CircularProgressIndicator();
                      }
                      return const SizedBox();
                    },
                    listener: (BuildContext context,
                        AuthenticationState state) async {
                      if (state is AuthenticationLoaded) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }
                    }),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      width: size.width * 0.35,
                      height: size.width * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.blueGrey, width: 1),
                      ),
                      child: InkWell(
                        child: Center(
                          child: Text(
                            'Vào nhanh',
                            style: AppTextStyles.authentication
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: size.width * 0.35,
                      height: size.width * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.blueGrey, width: 1),
                      ),
                      child: Center(
                        child: Text(
                          'Google',
                          style: AppTextStyles.authentication
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.width * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(AppTexts.unAccount),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RegisterScreen.routeName,
                        );
                      },
                      child: const Text(
                        AppTexts.reAccount,
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Visibility(
                  visible: false,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
