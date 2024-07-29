import 'package:design_system_sl/design_system_sl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VersionAppDebug extends StatefulWidget {
  const VersionAppDebug({super.key});

  @override
  State<VersionAppDebug> createState() => _VersionAppDebugState();
}

class _VersionAppDebugState extends State<VersionAppDebug> {
  int tapCount = 0;
  String version = "Phiên bản";
  String buildNumber="0.0.1";

  @override
  void initState() {
    _checkVersionApp();
    super.initState();
  }

  Future<void> _checkVersionApp() async {
    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // setState(() {
    //   version = S.current.user_version_app(packageInfo.version);
    //   buildNumber = packageInfo.buildNumber;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // if (F.appFlavor == Flavor.prod) {
        //   final profileUserCubit = context.read<ProfileUserCubit>();
        //   if (!profileUserCubit.isGuarantor) {
        //     return;
        //   }
        // }

        // tapCount++;

        // if (tapCount == 5) {
        //   context.showSnackBarSuccess(text: S.current.message_developer_mode);
        // }
        // if (tapCount >= 6) {
        //   alice.showInspector();
        // }
      },
      child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "$version+$buildNumber",
                style: SLStyle.t14R.copyWith(color: colorApp.labelSecondary),
              ),
            ],
          ),
    );
  }
}
