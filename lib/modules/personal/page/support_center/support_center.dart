
import 'package:design_system_sl/design_system_sl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_config.dart';
import 'package:flutter_app/modules/personal/widget/profile_body_button.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/button/base_button.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportCenterScreen extends StatelessWidget {
  const SupportCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: CustomAppbar.basic(
        title: "Trung tâm hỗ trợ",
        onTap: Navigator.of(context).pop,
      ),
      body:  const _DefaultHotline()

    );
  }
}



class _DefaultHotline extends StatelessWidget {
  const _DefaultHotline();

  @override
  Widget build(BuildContext context) {
    final listInfor = [
      ("Hotline", AppConfig.phoneNumber),

      ("Email", AppConfig.emailDefault),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BaseRoundedButton.all(
                    onTap: () async {
                      if (listInfor[index]
                          .$1
                          .contains("Email")) {
                        Share.share(AppConfig.emailDefault);
                      } else {
                        final Uri url =
                            Uri(scheme: 'tel', path: listInfor[index].$2);
                        await launchUrl(url);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {}
                      }
                    },
                    child: ProfileBodyButtonNext(
                      icon: BaseRoundedButton.all(
                        radius: 100,
                        backgroundColor: listInfor[index]
                                .$1
                                .contains("Email")
                            ? colorApp.blue.withOpacity(0.2)
                            : const Color(0xFFFF2D55).withOpacity(0.2),
                        child: listInfor[index]
                                .$1
                                .contains("Email")
                            ? Icon(
                                Icons.email_outlined,
                                color: colorApp.blue,
                              )
                            : const Icon(Icons.phone_in_talk_outlined,
                                color: Color(0xFFFF2D55)),
                      ),
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              listInfor[index].$1,
                              style: SLStyle.t16B,
                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            listInfor[index].$2,
                            style: SLStyle.t14R,
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 16.0,
                    ),
                itemCount: listInfor.length)
          ],
        ),
      ),
    );
  }
}
