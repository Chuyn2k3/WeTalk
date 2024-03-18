import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/personal/widget/appbar_widget.dart';
import 'package:flutter_app/modules/personal/widget/profile_widget.dart';
import 'package:flutter_app/modules/personal/widget/textfield_widget.dart';
import 'package:path/path.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  //User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: 'assets/images/anh_CV.jpg',
            isEdit: true,
            onClicked: () {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Tên người dùng',
            text: 'chuyen',
            onChanged: (name) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Email',
            text: 'chuyen',
            onChanged: (email) {},
          ),
          const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Giới thiệu',
            text: 'chuyen',
            maxLines: 5,
            onChanged: (about) {},
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
