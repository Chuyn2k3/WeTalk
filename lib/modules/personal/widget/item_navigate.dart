// ignore_for_file: deprecated_member_use

import 'package:design_system_sl/design_system_sl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/button/base_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemNavigate extends StatelessWidget {
  final (String, String, VoidCallback) recordValue;
  const ItemNavigate({super.key, required this.recordValue});

  @override
  Widget build(BuildContext context) {
    return BaseRoundedButton.all(
      onTap: recordValue.$3,
      radius: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(
            recordValue.$1,
            color: const Color.fromARGB(255, 74, 161, 232),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            recordValue.$2,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: SLStyle.t16M,
          ),
        ],
      ),
    );
  }
}
