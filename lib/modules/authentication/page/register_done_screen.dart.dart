import 'package:flutter/material.dart';
import 'package:flutter_app/modules/home/page/home_screen.dart.dart';

class RegisterDoneScreen extends StatelessWidget {
  const RegisterDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 70.0),
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
              const SizedBox(height: 20),
              const SizedBox(
                width: 150,
                height: 150,
                child: Icon(
                  Icons.home_outlined,
                  color: Colors.blue,
                  size: 150,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Đăng ký thành công',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  letterSpacing: 0.08,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                'Chào mừng bạn đến với app',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  letterSpacing: 0.08,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              // EditText để nhập OTP
              // Container(
              //   width: 300,
              //   child: TextField(
              //     decoration: InputDecoration(
              //       hintText: 'Username',
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       contentPadding: EdgeInsets.all(10),
              //     ),
              //   ),
              // ),
              // SizedBox(height: 50),
              Column(
                children: [
                  // Nút NEXT
                  SizedBox(
                    height: 60,
                    width: 320,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>const HomeScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text('Next',style: TextStyle(color: Colors.white, fontSize: 16),),
                    ),
                  ),
                  const SizedBox(height: 6),
                  // ProgressBar
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
      color: number == 3 ? Colors.blue[800] : Colors.white30,
      margin: const EdgeInsets.all(10),
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        child: Text(
          number.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
