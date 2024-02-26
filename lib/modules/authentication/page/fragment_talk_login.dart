import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/modules/authentication/bloc/login/authentication_bloc.dart';
import 'package:flutter_app/modules/authentication/bloc/login/authentication_bloc_event.dart';
import 'package:flutter_app/modules/authentication/bloc/login/authentication_bloc_state.dart';
import 'package:flutter_app/modules/home/page/fragment_talk_home1.dart';
import 'package:flutter_app/upload_video.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/page/fragment_talk_home.dart';
import 'fragment_talk_register.dart';

class MyWidget extends StatefulWidget {
  static String routeName = "login_screen";  

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final formfield = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passController = TextEditingController();
bool passToggle = false;
  AuthenticationBloc fetchLogin = AuthenticationBloc();
  
  @override
  Widget build(BuildContext context) {
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
                    height: 14,
                  ),
                  SizedBox(
                    height: 330,
                    child: Image.asset('assets/images/top_background1.png'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Chào Mừng Bạn',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                            bool emailVaild = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value!);
                            if (value.isEmpty) {
                              return 'Nhập email';
                            } else if (!emailVaild) {
                              return 'Email không hợp lệ';
                            }
                            return null;
                          },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      obscureText: passToggle,
                      controller: passController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(    
                        hintText: 'Mật khẩu',
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
                              )
                        ),
                       validator: (value) {
                            if (value!.isEmpty) {
                              return 'Nhập mật khẩu';
                            }
                            return null;
                          }, 
                      ),
                    ),
                  
        
                  const SizedBox(height: 10),
                Container(
                  height: 60,
                  padding: EdgeInsets.only(left: 220), // Dịch SizedBox cách lề phải 30px
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/btn_arraw1.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      iconSize: 60,
                      color: Colors.transparent, // Ẩn IconButton
                      onPressed: () async{
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
                            print('error');
                            return const CircularProgressIndicator();
                          }
                          return const SizedBox();
                        },
                        listener: (BuildContext context,
                            AuthenticationState state) async {
                          if (state is AuthenticationLoaded) {                          
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MainPage()),
                            );
                          }
                        }),
        
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        width: 140,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.blueGrey, width: 1),
                        ),
                        child: InkWell(
                          child: Center(
                            child: Text(
                              'Vào nhanh',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3B608C),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MainPage()),
                            );
                          },
                        ),

                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        width: 140,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.blueGrey, width: 1),
                        ),
                        child: Center(
                          child: Text(
                            'Google',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3B608C),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
        
        
        
        
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Bạn chưa có tài khoản?"),
                      GestureDetector(
                        onTap: () {
                          // Handle sign up
                          Navigator.push(
                            context,
                            // MaterialPageRoute(builder: (context) => TalkRegisterFragment()),
                            MaterialPageRoute(builder: (context) => TalkRegisterFragment()),
                          );
                        },
                        child: const Text(
                          ' Đăng kí',
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
