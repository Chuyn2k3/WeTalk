import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_term.dart';
import 'package:flutter_app/modules/authentication/page/login_screen.dart';
import 'package:flutter_app/utils/base_scaffold.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = 'splash_screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300), // Thời gian của fade animation
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        _navigateToLoginScreen();
      }
    });
  }

  void _navigateToLoginScreen() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseScaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FadeTransition(
                opacity: _animation,
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.asset(
                    'assets/image/logo.png',
                  ),
                ),
              ),
              //SizedBox(height: size.width * 0.1),
              // SizedBox(
              //   height: 50,
              //   width: 250,
              //   child:
              //       Lottie.asset('assets/animation/loading_splash_screen.json'),
              // ),
            ],
          ),
          Positioned(
            bottom: size.width * 0.1,
            left: 0,
            right: 0,
            child: const Text(
              AppTexts.developedBy,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
