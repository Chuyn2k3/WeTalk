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

  final TextEditingController _textEditingController = TextEditingController();
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
            Row(
              children: [
                Text('Lời mời kết bạn',
                    style: GoogleFonts.robotoFlex(color: Colors.white,fontSize: size.width * 0.05,
                            )),
                SearchForm(_textEditingController)
              ],
            ),
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


  Widget SearchForm(TextEditingController _textEditingController) {
    return TextFormField(
      //onChanged: search,
      maxLength: 500,
      controller: _textEditingController,
      decoration: const InputDecoration(
          filled: true,
          //fillColor: AppColors.white2,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
            borderSide: BorderSide(width: 0.8),
          ),
          //hintText: AppDeviceTerm.hintTextLookForm,
          prefixIcon: Icon(
            Icons.search,
            size: 30,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
            borderSide: BorderSide(width: 0.8),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
            borderSide: BorderSide(
              width: 4,
              color: Colors.blue,
            ),
          )),
    );
  }

}


