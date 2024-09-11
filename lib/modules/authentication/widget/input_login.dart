import 'package:design_system_sl/design_system_sl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/authentication/bloc/login/authentication_cubit.dart';
import 'package:flutter_app/modules/tab_bar/tab_bar.dart';
import 'package:flutter_app/utils/input_text_field.dart';
import 'package:flutter_app/utils/snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputLogin extends StatefulWidget {
  const InputLogin({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  @override
  State<InputLogin> createState() => _InputLoginState();
}

class _InputLoginState extends State<InputLogin> {
  bool _savePass = false;
  bool isActive = false;
  bool isLoading = false;
  void _updateActiveState() {
    final username = widget.usernameController.text;
    final password = widget.passwordController.text;
    setState(() {
      isActive = username.isNotEmpty && password.isNotEmpty;
    });
  }

  @override
  void initState() {
    _updateActiveState();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.usernameController.addListener(_updateActiveState);
    widget.passwordController.addListener(_updateActiveState);
  }

  @override
  void dispose() {
    widget.usernameController.removeListener(_updateActiveState);
    widget.passwordController.removeListener(_updateActiveState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
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
              const Text(
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
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {

        if (state is AuthenticationLoaded) {
          setState(() {
            isLoading = false;
          });
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainTabbarScreen(),
              ));
        }
        if (state is AuthenticationLoading) {
          setState(() {
            isLoading = true;
          });
        }
        if (state is AuthenticationError) {
          context.showSnackBarFail(
              text: "Tài khoản hoặc mật khẩu không chính xác");
          setState(() {
            isLoading = false;
          });
        }
      },
      child: Opacity(
        opacity: isActive ? 1 : 0.4,
        child: SLButton.brand(
          label: "Đăng nhập",
          onTap: isActive
              ? () {
                  context.read<AuthenticationCubit>().login(
                      widget.usernameController.text.trim(),
                      widget.passwordController.text.trim());
                }
              : null,
          isLoading: isLoading,
          isMaxWidth: true,
          size: SLSize.large,
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
        ),
      ),
    );
  }

  InkWell _forgotPassword(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Text(
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
          const Text(
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
