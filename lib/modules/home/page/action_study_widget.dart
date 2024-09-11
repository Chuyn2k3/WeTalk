import 'package:flutter/material.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_app/utils/study_enum.dart';

class ActionStudyDisplay extends StatelessWidget {
  const ActionStudyDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _actionItem(StudyEnum.vocabulary)),
            const SizedBox(
              width: 16,
            ),
            Expanded(child: _actionItem(StudyEnum.exam)),
          ],
        ),
        const SizedBox(
              height: 24,
            ),
        Row(
          children: [
            Expanded(child: _actionItem(StudyEnum.practice)),
            const SizedBox(
              width: 16,
            ),
            Expanded(child: _actionItem(StudyEnum.alphabet)),
          ],
        )
      ],
    );
  }
}

Widget _actionItem(StudyEnum action) {
  return InkWell(
    onTap: action.onTap,
    child: Container(
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: action.icon,
          ),
          const SizedBox(width: 16),
          Text(
            action.title,
            style: textTheme.t16M.copyWith(color: colorApp.labelSecondary),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    ),
  );
}
