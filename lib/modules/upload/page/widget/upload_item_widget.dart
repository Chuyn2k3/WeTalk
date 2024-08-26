import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/modules/upload/model/history_upload_model.dart';
import 'package:flutter_app/modules/upload/page/upload_detail_widget.dart';
import 'package:flutter_app/modules/upload/page/widget/item_card.dart';
import 'package:flutter_app/utils/common_app.dart';

class IteamDetailUpload extends StatelessWidget {
  const IteamDetailUpload({super.key, required this.item});
  final Data item;
  String getStatus(int status) {
    switch (status) {
      case 100:
        return "Đang chờ duyệt";
      case 200:
        return "Đã duyệt";
      default:
        return "Từ chối";
    }
  }

  Color getStatusColor(int status) {
    switch (status) {
      case 100:
        return Colors.yellowAccent;
      case 200:
        return Colors.green;
      default:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final status = item.status;
    return InkWell(
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailClaimScreen(data: item,),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorApp.bggSecondary),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemCard(
              title: "Từ vựng",
              content: item.vocabularyContent ?? "-",
            ),
            const SizedBox(height: 8),
            ItemCard(
              title: "Trạng thái",
              content: status != null ? getStatus(status) : "-",
              contentColor:
                  status != null ? getStatusColor(status) : Colors.black,
              contentWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
