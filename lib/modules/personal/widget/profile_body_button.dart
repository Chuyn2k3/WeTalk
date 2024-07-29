import 'package:flutter/material.dart';
import 'package:flutter_app/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ProfileBodyButtonNext extends StatelessWidget {
  final Widget icon;
  final Widget body;
  final VoidCallback? onTap;

  const ProfileBodyButtonNext({
    super.key,
    required this.icon,
    required this.body,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(
            width: 8,
          ),
          Expanded(child: body),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black26,
          )
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: const Divider(
        color: Color(0xFFF2F2F7),
        thickness: 1,
        height: 3,
      ),
    );
  }
}
