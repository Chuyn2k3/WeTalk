import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/modules/authentication/bloc/otp/otp_bloc.dart';
import 'package:flutter_app/modules/authentication/bloc/otp/otp_bloc_event.dart';
import 'package:flutter_app/modules/authentication/bloc/otp/otp_bloc_state.dart';
import 'package:flutter_app/modules/authentication/page/register_done_screen.dart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  const OtpScreen({super.key, required this.email});
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  OtpBloc fetchOtp = OtpBloc();

  final otpController = TextEditingController();
  late Timer _timer;
  int _start = 10;
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: size.width*0.05, right: size.width*0.05, top: 70.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTab(1),
                  _buildTab(2),
                  _buildTab(3),
                ],
              ),
              SizedBox(height: size.width*0.05),
              SizedBox(
                width: size.width*0.05,
                height: 150,
                child: Icon(
                  Icons.mail_outline,
                  color: Colors.blue,
                  size: 150,
                ),
              ),
              SizedBox(height: size.width*0.025),
              Text(
                'Enter OTP',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  letterSpacing: 0.08,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: size.width*0.05),
              Container(
                width: 200,
                child: TextField(
                  controller: otpController,
                  decoration: InputDecoration(
                    hintText: 'OTP',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Column(
                children: [
                  // Nút NEXT
                  SizedBox(
                    height: 60,
                    width: 320,
                    child: ElevatedButton(
                      onPressed: () {
                        fetchOtp.add(FetchOtp(
                            email: widget.email,
                            otp: int.parse(otpController.text)));
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                    ),
                  ),
                  BlocConsumer<OtpBloc, OtpState>(
                    bloc: fetchOtp,
                    builder: (context, state) {
                      if (state is OtpLoading) {
                        return const CircularProgressIndicator();
                      } else
                        return SizedBox();
                    },
                    listener: (BuildContext context, OtpState state) async {
                      if (state is OtpLoaded) {
                        print(state.data.message);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterDoneScreen()),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  // ProgressBar
                  SizedBox(height: 16),
                  Text(
                    'Resend OTP in $_start sec',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
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
      color: number == 2 ? Colors.blue[800] : Colors.white30,
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
}
