import 'package:design_system_sl/theme/components/button/enums.dart';
import 'package:design_system_sl/theme/components/button/sl_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/gen/assets.gen.dart';
import 'package:flutter_app/modules/personal/page/history.dart';
import 'package:flutter_app/modules/personal/widget/profile_body_button.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_app/utils/navigator_key.dart';
import 'package:flutter_app/utils/snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

enum UserProfileEnum {
  packageBattery,
  history,
  contact,
  privacy,
  guide,
  aboutUs,
  fqa,
  voteRate,
  updateApp
}

extension RenderUserProfileEnum on UserProfileEnum {
  String get toIconPath {
    switch (this) {
      case UserProfileEnum.packageBattery:
        return Assets.icon.package;
      case UserProfileEnum.history:
        return Assets.icon.clockCounterClockwise;
      case UserProfileEnum.contact:
        return Assets.icon.phoneCall;
      case UserProfileEnum.privacy:
        return Assets.icon.newspaperClipping;
      case UserProfileEnum.guide:
        return Assets.icon.video;
      case UserProfileEnum.aboutUs:
        return Assets.icon.aboutUs;
      case UserProfileEnum.fqa:
        return Assets.icon.question;
      case UserProfileEnum.voteRate:
        return Assets.icon.starHalf;
      case UserProfileEnum.updateApp:
        return Assets.icon.cloudArrowDown;
    }
  }

  String get toText {
    switch (this) {
      case UserProfileEnum.packageBattery:
        return "Gói dịch vụ";
      case UserProfileEnum.history:
        return "Giới thiệu người mới";
      case UserProfileEnum.contact:
        return "Thống kê & Lịch sử";
      case UserProfileEnum.privacy:
        return "Trung tâm hỗ trợ";
      case UserProfileEnum.aboutUs:
        return "Về chúng tôi";
      case UserProfileEnum.guide:
        return "Điều khoản & Chính sách";
      case UserProfileEnum.fqa:
        return "Hướng dẫn sử dụng";
      case UserProfileEnum.voteRate:
        return "Câu hỏi thường gặp";

      case UserProfileEnum.updateApp:
        return "Kiểm tra cập nhật ứng dụng";
    }
  }

  VoidCallback get onTap {
    switch (this) {
      case UserProfileEnum.packageBattery:
        return () {
          Navigator.push(
              getContext,
              MaterialPageRoute(
                builder: (context) => const ListHistoryScreen(),
              ));
        };
      case UserProfileEnum.history:
      case UserProfileEnum.contact:
      case UserProfileEnum.privacy:
      case UserProfileEnum.aboutUs:
      case UserProfileEnum.guide:
      case UserProfileEnum.fqa:
      case UserProfileEnum.voteRate:
      case UserProfileEnum.updateApp:
        return () {
          getContext.showSnackBarSuccess(text: "Đang phát triển");
        };
    }
  }

  Widget get toUI {
    return ProfileBodyButtonNext(
      onTap: onTap,
      icon: SvgPicture.asset(
        toIconPath,
      ),
      body: Text(
        toText,
        style: textTheme.t16R,
      ),
    );
  }
}
