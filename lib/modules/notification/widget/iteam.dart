import 'package:flutter/material.dart';
import 'package:flutter_app/gen/assets.gen.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ItemNotification extends StatelessWidget {
  const ItemNotification({super.key});


  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity:  1,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: Colors.white),
        child: Material(child: _screenImage(onTap: () {

        })),
      ),
    );
  }

  Widget _screenImage({required VoidCallback onTap}) {
    return InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icon/noti_default.svg',
                    fit: BoxFit.contain, width: 50),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    "Tiêu đề",
                    style:
                        textTheme.t16SB.copyWith(color: colorApp.labelPrimary),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),

            Text(
              "Nội dung test",
              style: textTheme.t14M.copyWith(color: colorApp.labelPrimary),
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

          ],
        ));
  }

  void _navigatorToDetailNotification(BuildContext context) {

  }
}
