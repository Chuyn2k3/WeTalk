import 'package:flutter/material.dart';
import 'package:flutter_app/modules/personal/page/about_us/about_us_screen.dart';
import 'package:flutter_app/modules/personal/page/support_center/support_center.dart';
import 'package:flutter_app/service/gen/assets.gen.dart';
import 'package:flutter_app/modules/chat/page/fragment_talk_chat.dart';
import 'package:flutter_app/modules/personal/page/history.dart';
import 'package:flutter_app/modules/personal/widget/profile_body_button.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_app/utils/navigator_key.dart';
import 'package:flutter_app/utils/snack_bar.dart';
import 'package:flutter_svg/svg.dart';

enum UserProfileEnum {
  packageBattery,
  message,
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
      case UserProfileEnum.message:
        return Assets.icon.message;
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
      case UserProfileEnum.message:
        return "Tin nhắn";
      case UserProfileEnum.history:
        return "Thống kê & Lịch sử";
      case UserProfileEnum.contact:
        return "Giới thiệu người mới";
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
          getContext.showSnackBarSuccess(text: "Đang phát triển");
        };
        case UserProfileEnum.message:
        return (){
          Navigator.push(
              getContext,
              MaterialPageRoute(
                builder: (context) => const ChatMainScreen(),
              ));
        };
      case UserProfileEnum.history:
        return () {
          Navigator.push(
              getContext,
              MaterialPageRoute(
                builder: (context) => const ListHistoryScreen(),
              ));
        };

      case UserProfileEnum.aboutUs:
      return () {
          Navigator.push(
              getContext,
              MaterialPageRoute(
                builder: (context) => const AboutUsScreen(),
              ));
        };

      case UserProfileEnum.privacy:
      return () {
          Navigator.push(
              getContext,
              MaterialPageRoute(
                builder: (context) => const SupportCenterScreen(),
              ));
        };
      case UserProfileEnum.contact:
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
