// ignore_for_file: deprecated_member_use

import 'package:design_system_sl/design_system_sl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/modules/personal/bloc/user_cubit.dart';
import 'package:flutter_app/modules/personal/detail_profile_enum.dart';
import 'package:flutter_app/modules/personal/model/user_model.dart';
import 'package:flutter_app/modules/personal/widget/circular_profile.dart';
import 'package:flutter_app/modules/personal/widget/profile_body_button.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/button/base_button.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailProfile extends StatelessWidget {
  const DetailProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: CustomAppbar.basic(
        title: "Tài khoản",
        onTap: Navigator.of(context).pop,
      ),
      body: BlocBuilder<UserInfoCubit, UserInfoState>(
        builder: (context, state) {
          if (state is UserInfoLoadingState) {
            return const CircularProgressIndicator();
          }
          UserModel user = UserModel();
          if (state is UserInfoLoadedState) {
            user = state.user;
          }

          return _DetailProfile(userModel: user);
        },
      ),
    );
  }
}

class _DetailProfile extends StatelessWidget {
  const _DetailProfile({
    required this.userModel,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    Widget dipslayInfoUser() {
      Widget eachRow(DetailProfileEnum field) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              field.toName,
              style: SLStyle.t14R,
            ),
            Text(
              field.getValue(userModel) ??"-",
              style: SLStyle.t14R.copyWith(
                  color: field.getValue(userModel) != null
                      ? Colors.black
                      : SLColor.labelQuarternaryLight.withOpacity(0.18)),
            ),
          ],
        );
      }

      return BaseRoundedButton.all(
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) =>
                eachRow(DetailProfileEnum.values[index]),
            separatorBuilder: (_, __) => const SizedBox(
                  height: 16,
                ),
            itemCount: DetailProfileEnum.values.length),
      );
    }

    Widget functionUser() {
      return BaseRoundedButton.all(
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return FunctionEditUser.values[index].toUi;
            },
            separatorBuilder: (_, __) => const CustomDivider(),
            itemCount: FunctionEditUser.values.length),
      );
    }

    Widget deleteUser() {
      return BaseRoundedButton.all(
        onTap: () {

        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
            Text(
              "Xóa tài khoản",
              style: textTheme.t16R.copyWith(color: AppColors.redColor),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 96.0,
              width: 96.0,
              child: CircularProfile(),
            ),
            const SizedBox(
              height: 24,
            ),
            dipslayInfoUser(),
            const SizedBox(
              height: 24,
            ),
            functionUser(),
            const SizedBox(height: 40),
            deleteUser()
          ],
        ),
      ),
    );
  }
}
