import 'package:flutter/material.dart';
import 'package:flutter_app/modules/authentication/bloc/register/register_bloc.dart';
import 'package:flutter_app/modules/authentication/bloc/register/register_bloc_event.dart';
import 'package:flutter_app/modules/authentication/bloc/register/register_bloc_state.dart';
import 'package:flutter_app/utils/show_dialog_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'fragment_talk_otp.dart';

class TalkRegisterFragment extends StatefulWidget {
  @override
  State<TalkRegisterFragment> createState() => _TalkRegisterFragmentState();
}

class _TalkRegisterFragmentState extends State<TalkRegisterFragment> {
  final formfield = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final genderController = TextEditingController();

  final addressController = TextEditingController();

  final ageController = TextEditingController();

  final passwordController = TextEditingController();

  RegisterBloc fetchRegister = RegisterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: Center(
          child: Form(
            key: formfield,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTab(1),
                    _buildTab(2),
                    _buildTab(3),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Nhập thông tin tài khoản',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: Card(
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            buildTextField(
                                'Tên người dùng', Icons.person, nameController),
                            SizedBox(height: 16),
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: 'email',
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
                                  return 'requireEmail';
                                } else if (!emailVaild) {
                                  return 'corectEmail';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16),
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
                                  child: buildTextField('Giới tính', Icons.male,
                                      genderController),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: buildTextField(
                                      'Địa chỉ', Icons.home, addressController),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            buildTextField(
                                'Tuổi', Icons.calendar_today, ageController),
                            SizedBox(height: 16),
                            buildTextField(
                                'Mật khẩu', Icons.lock, passwordController,
                                obscureText: true),
                            SizedBox(height: 16),
                            buildTextField('Nhập lại mật khẩu', Icons.lock,
                                passwordController,
                                obscureText: true),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 6),
                SizedBox(
                  height: 60,
                  width: 320,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formfield.currentState!.validate()) {
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
                            builder: (context) => LoginNumberPhonePage2(
                                  email: emailController.text,
                                )),
                      );
                    } else if (state is RegisterError) {
                      
                      showDialogCustomize(
                          context, AlertType.error, state.error);
                    }
                  },
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTab(int number) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: number == 1 ? Colors.blue[800] : Colors.white30,
      margin: EdgeInsets.all(10),
      child: Container(
        width: 32,
        height: 32,
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
      TextEditingController textController,
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
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
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
