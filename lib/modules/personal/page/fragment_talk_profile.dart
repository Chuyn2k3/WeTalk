import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/personal/page/fragment_talk_profile_edit.dart';
import 'package:flutter_app/modules/personal/widget/appbar_widget.dart';
import 'package:flutter_app/modules/personal/widget/button_widget.dart';
import 'package:flutter_app/modules/personal/widget/numbers_widget.dart';
import 'package:flutter_app/modules/personal/widget/profile_widget.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
          return Scaffold(
            backgroundColor: Colors.white,
          appBar: buildAppBar(context),
          body: ListView(

            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: 'assets/images/anh_CV.jpg',
                onClicked: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
              ),
              const SizedBox(height: 24),
              buildName(),
              const SizedBox(height: 24),
              //Center(child: buildUpgradeButton()),
              const SizedBox(height: 24),
              NumbersWidget(),
              const SizedBox(height: 48),
              buildAbout(),
            ],
          ),
        );


  }

  Widget buildName() => Column(
        children: [
          Text(
            'chuyen',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            'chuyenp32@gmail.com',
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'hehehe',
        onClicked: () {},
      );

  Widget buildAbout() => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Giới thiệu',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              '',
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
