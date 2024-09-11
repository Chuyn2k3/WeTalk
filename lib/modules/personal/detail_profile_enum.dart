import 'package:flutter/material.dart';
import 'package:flutter_app/modules/personal/model/user_model.dart';
import 'package:flutter_app/modules/personal/widget/profile_body_button.dart';
import 'package:flutter_app/utils/common_app.dart';
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
    final user0 = user.data;
    switch (this) {
      case DetailProfileEnum.fullName:
        return user0?.name;
      case DetailProfileEnum.userEmail:
        return user0?.email;
      case DetailProfileEnum.id:
        return user0?.userId.toString();
      case DetailProfileEnum.address:
        return user0?.address;
      case DetailProfileEnum.userPhone:
        return user0?.phoneNumber;
      case DetailProfileEnum.role:
        return user0?.role;
      case DetailProfileEnum.birthDay:
        return user0?.birthDay;
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
