// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomSheetAction extends StatelessWidget {
  BottomSheetAction({
    super.key,
    required this.icon,
    required this.label,
    required this.onClick,
  });

  String icon;
  String label;
  VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          padding: const EdgeInsets.all(0),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: onClick,
          icon: SvgPicture.asset(
            icon,
            width: 64,
            height: 64,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
