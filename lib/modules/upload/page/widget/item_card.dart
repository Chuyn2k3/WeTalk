// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/common_app.dart';

class ItemCard extends StatelessWidget {
  ItemCard({
    super.key,
    required this.title,
    required this.content,
    this.contentColor = Colors.black,
    this.contentWeight = FontWeight.normal,
  });

  String title;
  String content;
  Color contentColor;
  FontWeight contentWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: Text(
            title,
            style: textTheme.t14R,
          ),
        ),
        Text(
          content,
          style: textTheme.t14R.copyWith(
            color: contentColor,
            fontWeight: contentWeight,
          ),
        )
      ],
    );
  }
}
