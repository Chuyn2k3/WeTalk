import 'package:flutter/material.dart';
import 'package:flutter_app/modules/notification/widget/iteam.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';

import '../../../utils/base_scaffold.dart';

class HistoryNotificationScreen extends StatefulWidget {
  const HistoryNotificationScreen({super.key});

  @override
  State<HistoryNotificationScreen> createState() =>
      _HistoryNotificationScreenState();
}

class _HistoryNotificationScreenState extends State<HistoryNotificationScreen> {
  final _scrollController = ScrollController();
  var isLoadmore = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: CustomAppbar.basic(
          title: "Lịch sử thông báo",
          isLeading: false,
        ),
        body: _screen());
  }

  Widget _screen() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return _listByDate();
              }),
        ),
        const SizedBox(height: kBottomNavigationBarHeight)
      ],
    );
  }

  Widget _listByDate() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return const ItemNotification();
          },
        )
      ],
    );
  }
}
