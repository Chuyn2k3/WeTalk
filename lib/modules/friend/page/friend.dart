import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/data/term/study_link_image.dart';
import 'package:flutter_app/modules/friend/widget/add_friend.dart';
import 'package:flutter_app/modules/friend/widget/app_bar.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class FriendConectScreen extends StatefulWidget {
  const FriendConectScreen({super.key});

  @override
  State<FriendConectScreen> createState() => _FriendConectScreenState();
}

class _FriendConectScreenState extends State<FriendConectScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blackBackground,
      appBar: AppBarFriend(context, size),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: Row(
            //     children: [
            //       Container(
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.all(Radius.circular(30))),
            //         //color: Colors.grey,
            //         child: Center(
            //             child: Text(
            //           'Gợi ý',
            //           style: GoogleFonts.robotoFlex(color: Colors.white),
            //         )),
            //       ),
            //       Gap(size.height * 0.05),
            //       Container(
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.all(Radius.circular(30))),
            //           //color: Colors.grey,
            //           child: Center(
            //             child: Text('Bạn bè',
            //                 style: GoogleFonts.robotoFlex(color: Colors.white)),
            //           ))
            //     ],
            //   ),
            // ),
            Divider(
              height: size.height * 0.01,
              color: Colors.grey,
            ),
            Text('Lời mời kết bạn',
                style: GoogleFonts.robotoFlex(color: Colors.white,fontSize: size.width * 0.05,
                        )),
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return FriendAcept(ListName![index], size);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
