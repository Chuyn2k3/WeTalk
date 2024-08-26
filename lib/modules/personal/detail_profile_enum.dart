import 'package:design_system_sl/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/modules/personal/model/user_model.dart';
import 'package:flutter_app/modules/personal/widget/profile_body_button.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

enum DetailProfileEnum {
  fullName,
  userEmail,
  id,
  address,
  userPhone,

  role,
  birthDay,
}

extension ExtendDetailProfile on DetailProfileEnum {
  String get toName {
    switch (this) {
      case DetailProfileEnum.fullName:
        return "Họ tên";
      case DetailProfileEnum.userEmail:
        return "Email";
      case DetailProfileEnum.id:
        return "Id";
      case DetailProfileEnum.address:
        return "Địa chỉ";
      case DetailProfileEnum.userPhone:
        return "Số điện thoại";

      case DetailProfileEnum.role:
        return "Quyền";
      case DetailProfileEnum.birthDay:
        return "Ngày sinh";
    }
  }

  String? getValue(UserModel user) {
    final _user = user.data;
    switch (this) {
      case DetailProfileEnum.fullName:
        return _user?.name;
      case DetailProfileEnum.userEmail:
        return _user?.email;
      case DetailProfileEnum.id:
        return _user?.userId.toString();
      case DetailProfileEnum.address:
        return _user?.address;
      case DetailProfileEnum.userPhone:
        return _user?.phoneNumber;
      case DetailProfileEnum.role:
        return _user?.role;
      case DetailProfileEnum.birthDay:
        return _user?.birthDay;
    }
  }
}

enum FunctionEditUser {
  changeInfo,
  changePassWord,
}

extension ExtensionFunctionEdit on FunctionEditUser {
  String get path {
    switch (this) {
      case FunctionEditUser.changeInfo:
        return 'assets/icon/PencilSimpleLine.svg';
      case FunctionEditUser.changePassWord:
        return 'assets/icon/password.png';
    }
  }

  String get text {
    switch (this) {
      case FunctionEditUser.changeInfo:
        return "Thay đổi thông tin";
      case FunctionEditUser.changePassWord:
        return "Đổi mật khẩu";
    }
  }

  VoidCallback get onTap {
    switch (this) {
      case FunctionEditUser.changeInfo:
        return () {};
      case FunctionEditUser.changePassWord:
        return () {};
    }
  }

  Widget get toUi {
    Widget eachRow = ProfileBodyButtonNext(
      onTap: onTap,
      icon: SvgPicture.asset(path),
      body: Text(
        text,
        style: textTheme.t16R,
      ),
    );

    switch (this) {
      default:
        return eachRow;
    }
  }
}
