import 'package:flutter/material.dart';
import 'package:flutter_app/modules/personal/widget/item_navigate.dart';
import 'package:flutter_app/modules/upload/page/history_upload_screen.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';

class ListHistoryScreen extends StatelessWidget {
  const ListHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<(String, String, VoidCallback)> listInfor = [
      (
       "assets/image/upload.png",
        "Lịch sử cung cấp dữ liệu",
        () {
          Navigator.push(context, PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return HistoryUploadScreen();
            },
          ));
        }
      ),
      // (
      //   Assets.newAssets.icons.icHistoryReserve,
      //   S.current.reservation_history_history,
      //   () {
      //     GoRouter.of(context).push(RouteUri.reserveHistory);
      //   }
      // ),
      // (
      //   Assets.newAssets.icons.wallet,
      //   S.current.payment_history,
      //   () {
      //     Navigator.push(context, MaterialPageRoute(
      //       builder: (context) {
      //         return const HistoryPaymentScreen();
      //       },
      //     ));
      //   }
      // ),
      // (
      //   Assets.newAssets.icons.claimHistory,
      //   S.current.history_claim,
      //   () {
      //     context.push(RouteUri.claimHistory);
      //   }
      // ),
    ];
    return BaseScaffold(
      appBar: CustomAppbar.basic(
        title: "Lịch sử",
        onTap: Navigator.of(context).pop,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.extent(
          primary: false,
          padding: const EdgeInsets.symmetric(vertical: 16),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          maxCrossAxisExtent: 200.0,
          children: <Widget>[
            ItemNavigate(
              recordValue: listInfor[0],
            ),
            // ItemNavigate(
            //   recordValue: listInfor[1],
            // ),
            // ItemNavigate(
            //   recordValue: listInfor[2],
            // ),
            // ItemNavigate(
            //   recordValue: listInfor[3],
            // ),
          ],
        ),
      ),
    );
  }
}
