import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_term.dart';
import 'package:flutter_app/modules/authentication/bloc/register/register_bloc.dart';
import 'package:flutter_app/modules/authentication/bloc/register/register_bloc_event.dart';
import 'package:flutter_app/modules/authentication/bloc/register/register_bloc_state.dart';
import 'package:flutter_app/utils/show_dialog_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'otp_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static String routeName = 'register_screen';
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formfield = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final genderController = TextEditingController();

  final addressController = TextEditingController();

  final ageController = TextEditingController();

  final passwordController = TextEditingController();

  final passwordConfirmController = TextEditingController();

  RegisterBloc fetchRegister = RegisterBloc();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: size.height*0.08),
        child: Center(
          child: Form(
            key: formfield,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTab(1,size),
                    _buildTab(2,size),
                    _buildTab(3,size),
                  ],
                ),
                SizedBox(height: size.width*0.05),
                const Text(
                  AppRegister.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: size.width*0.05),
                Expanded(
                  child: Card(
                    margin: EdgeInsets.all(size.width*0.025),
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(size.width*0.025),
                        child: Column(
                          children: [
                            buildTextField(AppRegister.userName, Icons.person, nameController,size),
                            SizedBox(height: size.width*0.05),
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: AppLoginTerm.email,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                prefixIcon: Icon(Icons.email),
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
                            SizedBox(height: size.width*0.05),
                            SizedBox(
                              child: IntlPhoneField(
                                controller: phoneController,
                                decoration: InputDecoration(
                                  labelText: 'Mobile',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  prefixIcon: Icon(Icons.phone),
                                ),
                                initialCountryCode: 'VN',
                                onChanged: (phone) {
                                  // Handle phone number changes
                                },
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: buildTextField(AppRegister.gender, Icons.male,
                                      genderController,size),
                                ),
                                SizedBox(width: size.width*0.05),
                                Expanded(
                                  child: buildTextField(
                                      AppRegister.address, Icons.home, addressController,size),
                                ),
                              ],
                            ),
                            SizedBox(height: size.width*0.05),
                            buildTextField(
                                AppRegister.age, Icons.calendar_today, ageController,size),
                            SizedBox(height: size.width*0.05),
                            buildTextField(
                                AppLoginTerm.password, Icons.lock, passwordController,size,
                                obscureText: true),
                            SizedBox(height: size.width*0.05),
                            TextFormField(
                              controller: passwordConfirmController,
                              obscureText: true,
                              //keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                labelText: AppRegister.confirmPass,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                prefixIcon: Icon(Icons.lock),
                              ),
                              validator: (value) {
                                if (value == '') {
                                  return AppRegister.needRepeatPass;
                                } else if (value != passwordController.text) {
                                  return AppRegister.errorConfirmPass;
                                }
                                //return null;
                              },
                            ),
                            // buildTextField('Nhập lại mật khẩu', Icons.lock,
                            //     passwordConfirmController,
                            //     obscureText: true),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 6),
                SizedBox(
                  height: size.width*0.15,
                  width: size.height*0.4,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formfield.currentState!.validate() ||
                          (passwordController.text ==
                              passwordConfirmController.text)) {
                        fetchRegister.add(FetchRegister(
                            name: nameController.text.isNotEmpty
                                ? nameController.text
                                : ' ',
                            email: emailController.text,
                            phone: phoneController.text.isNotEmpty
                                ? phoneController.text
                                : ' ',
                            password: passwordController.text,
                            address: addressController.text.isNotEmpty
                                ? addressController.text
                                : ' ',
                            gender: genderController.text.isNotEmpty
                                ? genderController.text
                                : ' ',
                            age: ageController.text.isNotEmpty
                                ? int.parse(ageController.text)
                                : 0));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Send OTP'),
                  ),
                ),
                BlocConsumer<RegisterBloc, RegisterState>(
                  bloc: fetchRegister,
                  builder: (context, state) {
                    if (state is RegisterLoading) {
                      return const CircularProgressIndicator();
                    }
                    return SizedBox();
                  },
                  listener: (BuildContext context, RegisterState state) async {
                    if (state is RegisterLoaded) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OtpScreen(
                                  email: emailController.text,
                                )),
                      );
                    } else if (state is RegisterError) {
                      showDialogCustomize(
                          context, AlertType.error, state.error);
                    }
                  },
                ),
                SizedBox(height: size.width*0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTab(int number, Size size) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: number == 1 ? Colors.blue[800] : Colors.white30,
      margin: EdgeInsets.all(10),
      child: Container(
        width: size.width*0.1,
        height: size.width*0.1,
        alignment: Alignment.center,
        child: Text(
          number.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hintText, IconData? prefixIcon,
      TextEditingController textController,Size size,
      {bool obscureText = false}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: textController,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: size.width*0.025, horizontal: size.width*0.05),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        ),
      ),
    );
  }
}
