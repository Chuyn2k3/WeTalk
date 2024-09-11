import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/authentication/bloc/register/register_bloc.dart';
import 'package:flutter_app/modules/authentication/bloc/register/register_bloc_state.dart';
import 'package:flutter_app/modules/authentication/page/login_screen.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/input_text_field.dart';
import 'package:flutter_app/widget/circular_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  bool _savePass = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back_ios,
          size: 18,
        ),
        title: const Text("Tạo tài khoản"),
      ),
      body: Form(
        key: formfield,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.,
          children: [
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(size.width * 0.025),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Họ và tên',
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      InputTextField(
                        hintText: 'Nhập họ tên của bạn',
                        maxLine: 1,
                        textAlign: TextAlign.left,
                        textController: nameController,
                        // validator: (item) => Validator.validateString(
                        //     str: item ?? '', name: S.current.user_account)
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Số điện thoại',
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      InputTextField(
                        hintText: 'Nhập số điện thoại',
                        maxLine: 1,
                        textAlign: TextAlign.left,
                        textController: phoneController,
                        // validator: (item) => Validator.validateString(
                        //     str: item ?? '', name: S.current.user_account)
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Email',
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      InputTextField(
                        hintText: 'Nhập email của bạn',
                        maxLine: 1,
                        textAlign: TextAlign.left,
                        textController: emailController,
                        // validator: (item) => Validator.validateString(
                        //     str: item ?? '', name: S.current.user_account)
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Mật khẩu',
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      InputTextField(
                        hintText: 'Nhập mật khẩu',
                        maxLine: 1,
                        textAlign: TextAlign.left,
                        textController: passwordController,
                        // validator: (item) => Validator.validateString(
                        //     str: item ?? '', name: S.current.user_account)
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Xác nhận mật khẩu',
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      InputTextField(
                        hintText: 'Nhập lại mật khẩu',
                        maxLine: 1,
                        textAlign: TextAlign.left,
                        textController: passwordConfirmController,
                        // validator: (item) => Validator.validateString(
                        //     str: item ?? '', name: S.current.user_account)
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _rememberPass(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: _forgotPassword(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            _buttonLogin(),
            _textRegister(context),
            SizedBox(height: size.width * 0.05),
          ],
        ),
      ),
    );
  }

  Widget _buttonLogin() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                email: emailController.text,
              ),
            ));
        // fetchRegister.add(FetchRegister(
        //     name: nameController.text.isNotEmpty ? nameController.text : ' ',
        //     email: emailController.text,
        //     phone: phoneController.text.isNotEmpty ? phoneController.text : ' ',
        //     password: passwordController.text,
        //     address: addressController.text.isNotEmpty
        //         ? addressController.text
        //         : ' ',
        //     gender:
        //         genderController.text.isNotEmpty ? genderController.text : ' ',
        //     age: ageController.text.isNotEmpty
        //         ? int.parse(ageController.text)
        //         : 0));
      },
      child: BlocConsumer<RegisterBloc, RegisterState>(
        bloc: fetchRegister,
        listener: (context, state) {
          if (state is RegisterLoaded) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OtpScreen(
                    email: emailController.text,
                  ),
                ));
          }
        },
        builder: (context, state) {
          if (state is RegisterLoading) {
            return const CircularIndicator();
          }
          return IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0x99007AFF),
              ),
              padding: const EdgeInsets.symmetric(vertical: 13),
              margin: const EdgeInsets.only(bottom: 13, left: 10, right: 10),
              width: double.infinity,
              child: const Column(children: [
                Text(
                  'Tạo tài khoản',
                  style: TextStyle(
                    color: Color(0xFFffffff),
                    fontSize: 16,
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }

  InkWell _forgotPassword(BuildContext context) {
    return InkWell(
      onTap: () {
        //GoRouter.of(context).push(RouteUri.forgotPassword);
      },
      child: const Text(
        'Điều khoản sử dụng',
        style: TextStyle(
          color: Color(0xFF007aff),
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _rememberPass() {
    return GestureDetector(
      onTap: () {
        setState(() {
          setState(() {
            _savePass = !_savePass;
          });
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: _buildCheckBoxRememberPasswordWidget(),
          ),
          const SizedBox(
            width: 4,
          ),
          const Text(
            'Tôi đồng ý với',
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCheckBoxRememberPasswordWidget() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _savePass = !_savePass;
        });
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: const Color.fromRGBO(221, 221, 227, 1),
            width: 1,
          ),
          color:
              _savePass ? Colors.blue : const Color.fromRGBO(245, 245, 250, 1),
        ),
        child: _savePass
            ? const Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              )
            : null,
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
            const TextSpan(
              text: "Đã có tài khoản?",
              style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 16,
              ),
            ),
            const TextSpan(
              text: '  ',
            ),
            TextSpan(
              text: "Đăng nhập",
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  //GoRouter.of(context).push(RouteUri.register);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
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
