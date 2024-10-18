import 'package:flutter/material.dart';
import 'package:flutter_app/modules/personal/page/about_us/about_us_enum.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/button/base_button.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: CustomAppbar.basic(
        title: "Về chúng tôi",
        onTap: ()=>Navigator.pop(context),
      ),
      body: const _AboutUsScreen(),
    );
  }
}

class _AboutUsScreen extends StatelessWidget {
  const _AboutUsScreen();

  @override
  Widget build(BuildContext context) {
    final companyInfo = ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context, index) => AboutUsEnum.values[index].toWidget,
        separatorBuilder: (_, __) => const SizedBox(
              height: 8,
            ),
        itemCount: AboutUsEnum.values.length);
    // final companyConnectOutSize = ListView.separated(
    //     physics: const NeverScrollableScrollPhysics(),
    //     padding: EdgeInsets.zero,
    //     shrinkWrap: true,
    //     itemBuilder: (context, index) => ConnectOutSize.values[index].toUi,
    //     separatorBuilder: (_, __) => const CustomDivider(),
    //     itemCount: ConnectOutSize.values.length);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16)
          .copyWith(bottom: kBottomNavigationBarHeight + 16),
      child: BaseRoundedButton.all(
        child: Column(
          children: [
            companyInfo,
            // InkWell(
            //   onTap: _onClickDeclaredCopyrightVn,
            //   child: Container(
            //     margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            //     alignment: Alignment.centerLeft,
            //     child: Image.asset(
            //       Assets.newAssets.images.declaredCopyrightVn.path,
            //       width: 160,
            //       height: 60,
            //       fit: BoxFit.fill,
            //     ),
            //   ),
            // ),
            // const CustomDivider(),
            // companyConnectOutSize,
          ],
        ),
      ),
    );
  }

  // void _onClickDeclaredCopyrightVn() {
  //   launchUrlString(F.linkMinistryOfIndustryAndCommerceVietnam);
  // }
}
