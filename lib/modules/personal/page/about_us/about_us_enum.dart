import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_config.dart';
import 'package:flutter_app/modules/personal/widget/profile_body_button.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:url_launcher/url_launcher.dart';


enum AboutUsEnum {
  companyName,
  hotline,
  email,
  website,
 officeRepresent,
  // officeRepresentsMB,
  // officeRepresentsMT,
  // officeRepresentsMN,
}

extension ExtensionAboutUs on AboutUsEnum {
  String get text {
    switch (this) {
      case AboutUsEnum.companyName:
        return "IBME LABORATORY";
      case AboutUsEnum.hotline:
        return AppConfig.phoneNumber;
      case AboutUsEnum.email:
        return AppConfig.emailDefault;
      case AboutUsEnum.website:
        return AppConfig.linkWebSite;
      case AboutUsEnum.officeRepresent:
        return "Phòng E814, E822 tòa nhà C7 - Đại học Bách Khoa Hà Nội, số 1 Đại Cồ Việt";

    //   case AboutUsEnum.officeRepresentsMB:
    //     return '- ${S.current.northern}: ${S.current.officeRepresentativeMB}';

    //   case AboutUsEnum.officeRepresentsMT:
    //     return '- ${S.current.central_region}: ${S.current.officeRepresentativeMT}';

    //   case AboutUsEnum.officeRepresentsMN:
    //     return '- ${S.current.southern}: ${S.current.officeRepresentativeMN}';
     }
  }

  Widget get toWidget {
    Row eachRowClick(VoidCallback callBack, String preText) {
      return Row(children: [
        Text(preText),
        GestureDetector(
            onTap: callBack,
            child:
                Text(text, style: textTheme.t14R.copyWith(color: Colors.blue)))
      ]);
    }

    switch (this) {
      case AboutUsEnum.hotline:
        return eachRowClick(() async {
          final Uri uri = Uri(scheme: 'tel', path: AppConfig.phoneNumber);
          await launchUrl(uri);
        }, 'Hotline: ');
      case AboutUsEnum.email:
        return eachRowClick(() async {
          final Uri uri = Uri(scheme: 'mailto', path: AppConfig.phoneNumber);
          await launchUrl(uri);
        }, 'Email: ');
      case AboutUsEnum.website:
        return eachRowClick(() async {
          final Uri uri = Uri.parse(AppConfig.linkWebSite);
          await launchUrl(uri, mode: LaunchMode.platformDefault);
        }, 'Website: ');
      case AboutUsEnum.companyName:
        return Text(
          text,
          style: textTheme.t16B.copyWith(color: colorApp.primary),
        );
      default:
        return Text(
          text,
          style: textTheme.t14R.copyWith(color: colorApp.labelPrimary),
        );
    }
  }
}

// enum ConnectOutSize { mainPage, groupPage, youtube, mainWebsite }

// extension ExtensionConnectOutSize on ConnectOutSize {
//   String get text {
//     switch (this) {
//       case ConnectOutSize.mainPage:
//         return S.current.face_book_fanPage;
//       case ConnectOutSize.groupPage:
//         return S.current.group_fanPage_users;
//       case ConnectOutSize.youtube:
//         return S.current.selex_on_youtube;
//       case ConnectOutSize.mainWebsite:
//         return S.current.selex_website;
//     }
//   }

//   Widget get toText {
//     return Text(
//       text,
//       style: textTheme.t16R.copyWith(color: colorApp.primary),
//     );
//   }

//   String get linkConnect {
//     switch (this) {
//       case ConnectOutSize.mainPage:
//         return AppConfig.linkFanPage;
//       case ConnectOutSize.groupPage:
//         return AppConfig.linkUserGroup;
//       case ConnectOutSize.youtube:
//         return AppConfig.linkYoutube;
//       case ConnectOutSize.mainWebsite:
//         return AppConfig.linkWebSite;
//     }
//   }

//   Widget get toUi {
//     return ProfileBodyButtonNext(
//         onTap: () async {
//           try {
//             final Uri uri = Uri.parse(linkConnect);
//             await launchUrl(uri, mode: LaunchMode.platformDefault);
//           } catch (e) {
//             final Uri fallbackUri = Uri.parse(linkConnect);
//             await launchUrl(fallbackUri, mode: LaunchMode.externalApplication);
//           }
//         },
//         icon: const SizedBox.shrink(),
//         body: toText);
//   }
// }
