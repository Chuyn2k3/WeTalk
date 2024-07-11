import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_term.dart';
import 'package:flutter_app/data/term/study_link_image.dart';
import 'package:flutter_app/data/term/text_style.dart';
import 'package:flutter_app/modules/authentication/page/login_screen.dart';
import 'package:flutter_app/utils/base_scaffold.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = 'splash_screen';

  const SplashScreen({super.key, });
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        LoginScreen.routeName,
      );
    });
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
              Image.asset(
                'assets/image/WeSignLogo.png',
                width: size.width * 0.4,
                height: size.width * 0.4,
              ),
              SizedBox(height: size.width * 0.1),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ],
          ),
          Positioned(
            bottom: size.width * 0.1,
            left: 0,
            right: 0,
            child: Text(AppTexts.developedBy,
                textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
