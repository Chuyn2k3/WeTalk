import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

Widget FriendAcept(String name,Size size) {
  return Container(
    margin: EdgeInsets.all(12),
    width: size.width*0.2,
    height: size.width*0.2,
    child: Row(
      children: [
        CircleAvatar(backgroundImage: AssetImage('assets/images/anh_CV.jpg'),radius: 45,),
       Gap(size.width*0.03),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$name',style: GoogleFonts.lato(fontSize: size.width*0.055,color: Colors.white)),
              Gap(size.width*0.035),
              Expanded(
                child: Row(
                  children: [
                    ElevatedButton(

                      onPressed: (){}, child: Text('Chấp nhận'),style:  ElevatedButton.styleFrom(
                primary: AppColors.blue,
                 // Đổi màu nền thành màu xanh
              )),
                    Gap(size.width*0.035),
                    ElevatedButton(onPressed: (){}, child: Text('Xóa',),style:  ElevatedButton.styleFrom(
                primary: AppColors.greyFriend, // Đổi màu nền thành màu xanh
              )),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
