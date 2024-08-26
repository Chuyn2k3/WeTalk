import 'package:design_system_sl/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/gen/assets.gen.dart';
import 'package:flutter_app/modules/authentication/page/login_screen.dart';
import 'package:flutter_app/modules/personal/bloc/user_cubit.dart';
import 'package:flutter_app/modules/personal/enum.dart';
import 'package:flutter_app/modules/personal/model/user_model.dart';
import 'package:flutter_app/modules/personal/page/detail_profile.dart';
import 'package:flutter_app/modules/personal/widget/circular_profile.dart';
import 'package:flutter_app/modules/personal/widget/profile_body_button.dart';
import 'package:flutter_app/modules/personal/widget/version_app.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/button/base_button.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';
import 'package:flutter_app/utils/navigator_key.dart';
import 'package:flutter_app/utils/snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _UserProfileScreen();
  }
}

class _UserProfileScreen extends StatefulWidget {
  const _UserProfileScreen();

  @override
  State<_UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<_UserProfileScreen> {
  late UserInfoCubit _userInfoCubit;
  @override
  void initState() {
    super.initState();
    _userInfoCubit = UserInfoCubit();
  }

  @override
  Widget build(BuildContext context) {
    late Widget displayName = BaseRoundedButton.all(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailProfile(),
            ));
      },
      child: ProfileBodyButtonNext(
        icon: const SizedBox(
          height: 48.0,
          width: 48.0,
          child: CircularProfile(),
        ),
        body: BlocConsumer<UserInfoCubit, UserInfoState>(
            listener: (context, state) {
          if (state is UserInfoErrorState) {
            context.showSnackBarFail(text: state.error);
          }
        }, builder: (context, state) {
          if (state is UserInfoLoadedState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  state.user.data?.name ?? '',
                  style: SLStyle.t16M,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  state.user.data?.phoneNumber?.toString() ?? "",
                  style: SLStyle.t16R,
                )
              ],
            );
          }
          return const SizedBox.shrink();
        }),
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
      body: BlocProvider(
        create: (context) => _userInfoCubit..getUserInfo(),
        child: Padding(
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
