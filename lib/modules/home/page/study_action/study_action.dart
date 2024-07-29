import 'package:flutter/material.dart';
import 'package:flutter_app/gen/assets.gen.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_app/utils/study_enum.dart';
import 'package:flutter_svg/svg.dart';

class ActionStudy extends StatefulWidget {
  const ActionStudy({super.key});

  @override
  State<ActionStudy> createState() => _ActionStudyState();
}

class _ActionStudyState extends State<ActionStudy> {
  ScrollController scrollController = ScrollController();
  void _previousPage(double widthItem) {
    scrollController.animateTo(
      scrollController.offset - widthItem * 0.35,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _nextPage(double widthItem) {
    scrollController.animateTo(
      scrollController.offset + widthItem * 0.35,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: Colors.white),
      child: Row(
        children: [
          IconButton(
            icon: SvgPicture.asset(Assets.icon.arrowBackSvg),
            onPressed: () => _previousPage(size.width * 0.67),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              height: 110,
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: StudyEnum.values.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildActionItem(StudyEnum.values[index], size),
                  );
                },
              ),
            ),
          ),
          IconButton(
            icon: SvgPicture.asset(Assets.icon.arrowForwardSvg),
            onPressed: () => _nextPage(size.width * 0.67),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem(StudyEnum action, Size size) {
    return Column(
      children: [
        InkWell(
            onTap: action.onTap,
            child: SizedBox(
              height: 50,
              width: 50,
              child: action.icon,
            )),
        const SizedBox(height: 8),
        Text(
          action.title,
          style: textTheme.t14M.copyWith(color: colorApp.labelSecondary),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
