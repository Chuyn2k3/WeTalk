import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/service/gen/assets.gen.dart';
import 'package:flutter_app/modules/upload/page/widget/item_card.dart';
import 'package:flutter_app/modules/upload/page/widget/video_display.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';
import 'package:flutter_app/utils/extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_app/modules/upload/model/history_upload_model.dart';

class DetailClaimScreen extends StatefulWidget {
  const DetailClaimScreen({super.key, required this.data});

  final Data data;

  @override
  State<DetailClaimScreen> createState() => _DetailClaimScreenState();
}

class _DetailClaimScreenState extends State<DetailClaimScreen> {
  String status = '';
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: CustomAppbar.basic(
        onTap: () => Navigator.of(context).pop(),
        title: "Chi tiết",
      ),
      body: _buildDetailClaimInfo(),
    );
  }

  Widget _buildDetailClaimInfo() {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ..._buildGeneralInfo(widget.data, context),
        ],
      ),
    );
  }

  List<Widget> _buildGeneralInfo(Data data, BuildContext context) {
    final status = data.status;
    return [
      const SizedBox(height: 24),
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorApp.bggSecondary),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemCard(
              title: "Thời gian",
              content: data.createdDate?.formatDate(
                    formatIn: "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
                    formatOut: "HH:mm dd/MM/yyyy",
                  ) ??
                  "-",
            ),
            const SizedBox(height: 16),
            ItemCard(
              title: "Từ vựng",
              content: data.vocabularyContent ?? "-",
            ),
            const SizedBox(height: 16),
            ItemCard(
              title: "Trạng thái",
              content: status != null ? getStatus(status) : '-',
              contentColor:
                  status != null ? getStatusColor(status) : Colors.black,
              contentWeight: FontWeight.bold,
            ),
            const SizedBox(height: 16),
            if (data.detectionContent != null) ...[
              ItemCard(
                title: "Từ vựng nhận diện bởi AI",
                content: data.detectionContent ?? '-',
              ),
              ItemCard(
                  title: "Độ chính xác",
                  content: data.score != null ? data.score.toString() : "-"),
            ],
            const SizedBox(height: 16),
            if (data.dataLocation?.isNotEmpty ?? false) ...[
              const Text("Ấn vào để xem"),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                height: 48,
                //width: double.maxFinite,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 48,
                    height: 48,
                    color: AppColors.grey5Color,
                    child: _buildViewForAttachment(
                      data.dataLocation ?? "",
                      context,
                    ),
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    ];
  }

  Widget _buildViewForAttachment(String dataLocation, BuildContext context) {
    if (dataLocation.contains(".jpg")) {
      return InkWell(
        onTap: () async {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Image.network(
                    dataLocation.replaceFirst("wetalk", "wesign")),
              );
            },
          );
        },
        child: Image.network(
          dataLocation.replaceFirst("wetalk", "wesign"),
          fit: BoxFit.fitWidth,
          width: 48,
          height: 48,
        ),
      );
    }

    if (dataLocation.contains(".mp4")) {
      return InkWell(
        onTap: () {
          showDialogPlayVideo(
            context: context,
            medialUrl: dataLocation.replaceFirst("wetalk", "wesign"),
          );
        },
        child: Stack(
          children: [
            Image.network(
              dataLocation,
              width: 48,
              height: 48,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 48,
                  height: 48,
                  color: const Color(0xFF007AFF),
                );
              },
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  Assets.icon.iconVideo,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }

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
}
