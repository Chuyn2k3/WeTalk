import 'package:design_system_sl/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/gen/assets.gen.dart';
import 'package:flutter_app/modules/authentication/page/login_screen.dart';
import 'package:flutter_app/modules/personal/bloc/user_cubit.dart';
import 'package:flutter_app/modules/personal/enum.dart';
import 'package:flutter_app/modules/personal/model/user_model.dart';
import 'package:flutter_app/modules/personal/widget/circular_profile.dart';
import 'package:flutter_app/modules/personal/widget/profile_body_button.dart';
import 'package:flutter_app/modules/personal/widget/version_app.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/button/base_button.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';
import 'package:flutter_app/utils/navigator_key.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _UserProfileScreen();
  }
}

class _UserProfileScreen extends StatelessWidget {
  const _UserProfileScreen();

  @override
  Widget build(BuildContext context) {
    var user = UserModel();
    if ((context.read<UserInfoCubit>().state is UserInfoLoadedState)) {
      user = (context.read<UserInfoCubit>().state as UserInfoLoadedState).user;
    }

    late Widget displayName = BaseRoundedButton.all(
      onTap: () {},
      child: ProfileBodyButtonNext(
        icon: const SizedBox(
          height: 48.0,
          width: 48.0,
          child: CircularProfile(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              user.data?.name ?? '',
              style: SLStyle.t16M,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              user.data?.phoneNumber?.toString() ?? "",
              style: SLStyle.t16R,
            )
          ],
        ),
      ),
    );

    Widget displayFunction([int cutTheLine = 1]) {
      final int lengthOfFuncion = UserProfileEnum.values.length;
      List<UserProfileEnum> functionUser = UserProfileEnum.values
          .getRange(0, lengthOfFuncion - cutTheLine)
          .toList();

      List<UserProfileEnum> functionApp = UserProfileEnum.values
          .getRange(lengthOfFuncion - cutTheLine, lengthOfFuncion)
          .toList();

      Widget eachFunction(List<UserProfileEnum> listFunctions) =>
          BaseRoundedButton.all(
            margin: const EdgeInsets.only(top: 24),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => listFunctions[index].toUI,
              separatorBuilder: (context, index) => const CustomDivider(),
              itemCount: listFunctions.length,
            ),
          );

      return Column(
        children: [
          functionUser,
          functionApp,
        ].map((e) => eachFunction(e)).toList(),
      );
    }

    return BaseScaffold(
      appBar: CustomAppbar.basic(
        isLeading: false,
        title: "Tài khoản",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              displayName,
              displayFunction(),
              const SizedBox(height: 24),
              const VersionAppDebug(),
              deleteUser(),
              const SizedBox(height: 24 + kBottomNavigationBarHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget deleteUser() {
    return BaseRoundedButton.all(
      onTap: () {
        Navigator.push(
            getContext,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         // Assets.newAssets.icons.deleteAccount.image(height: 20),
          const SizedBox(width: 8),
          Text(
            "Đăng Xuất",
            style: textTheme.t16R.copyWith(color: AppColors.redColor),
          ),
        ],
      ),
    );
  }
}
