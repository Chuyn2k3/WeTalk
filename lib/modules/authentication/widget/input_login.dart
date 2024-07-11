import 'package:flutter/material.dart';
import 'package:flutter_app/modules/authentication/bloc/login/authentication_bloc.dart';
import 'package:flutter_app/modules/authentication/bloc/login/authentication_bloc_event.dart';
import 'package:flutter_app/modules/authentication/bloc/login/authentication_bloc_state.dart';
import 'package:flutter_app/modules/tab_bar/tab_bar.dart';
import 'package:flutter_app/utils/input_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputLogin extends StatefulWidget {
  const InputLogin(
      {super.key,
      required this.usernameController,
      required this.passwordController, required this.fetchLogin,
      });
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final AuthenticationBloc fetchLogin;
  @override
  State<InputLogin> createState() => _InputLoginState();
}

class _InputLoginState extends State<InputLogin> {
  bool _savePass = false;
  @override
  void initState() {
    super.initState();
  }

  // void getSaveInfoCheck() async {
  //   _savePass = GetIt.instance
  //           .get<SharedPreferencesManager>()
  //           .getBool(AppConfig.SL_REMEMBER_PASSWORD) ??
  //       false;
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   widget.usernameController.addListener(_updateActiveState);
  //   widget.passwordController.addListener(_updateActiveState);
  // }

  // @override
  // void dispose() {
  //   widget.usernameController.removeListener(_updateActiveState);
  //   widget.passwordController.removeListener(_updateActiveState);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tài khoản',
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              InputTextField(
                hintText: 'Nhập tài khoản hoặc số điện thoại',
                maxLine: 1,
                textAlign: TextAlign.left,
                textController: widget.usernameController,
                // validator: (item) => Validator.validateString(
                //     str: item ?? '', name: S.current.user_account)
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mật khẩu",
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              InputTextField(
                hintText: 'Nhập mật khẩu của bạn',
                maxLine: 1,
                textAlign: TextAlign.left,
                textController: widget.passwordController,
                // validator: (item) => Validator.validateString(
                //     str: item ?? '', name: S.current.user_account)
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _rememberPass(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: _forgotPassword(context),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buttonLogin()
      ],
    );
  }

  Widget _buttonLogin() {
    return InkWell(
      onTap: () {
        widget.fetchLogin.add(FetchLogin(
                              email: widget.usernameController.text,
                              password: widget.passwordController.text));
      },
      child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        bloc: widget.fetchLogin,
        listener: (context, state) {
          if (state is AuthenticationLoaded) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainTabbarScreen(),
                ));
          }
        },
        builder: (context, state) {


          if (state is AuthenticationLoading) {
            return CircularProgressIndicator();
          }
          return IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0x99007AFF),
              ),
              padding: EdgeInsets.symmetric(vertical: 13),
              margin: EdgeInsets.only(bottom: 13, left: 10, right: 10),
              width: double.infinity,
              child: Column(children: [
                Text(
                  'Đăng nhập',
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
      child: Text(
        'Quên mật khẩu?',
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
          Text(
            'Ghi nhớ mật khẩu',
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

  // Future<void> saveInfo() async {
  //   await GetIt.instance
  //       .get<SharedPreferencesManager>()
  //       .putString(AppConfig.SL_USERNAME, widget.usernameController.text);

  //   await GetIt.instance
  //       .get<SharedPreferencesManager>()
  //       .putBool(AppConfig.SL_REMEMBER_PASSWORD, _savePass);
  //   if (_savePass) {
  //     await GetIt.instance
  //         .get<SharedPreferencesManager>()
  //         .putString(AppConfig.SL_PASSWORD, widget.passwordController.text);
  //   } else {
  //     GetIt.instance
  //         .get<SharedPreferencesManager>()
  //         .putString(AppConfig.SL_PASSWORD, "");
  //   }
  // }

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
}
