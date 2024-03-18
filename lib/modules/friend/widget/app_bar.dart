// import 'package:devquiz/core/core.dart';
// import 'package:devquiz/home/widgets/scorecard/score_card_widget.dart';
// import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_gradients.dart';
import 'package:flutter_app/data/term/text_style.dart';
import 'package:flutter_app/modules/study/widget/scorecard.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarFriend extends PreferredSize {
  final Size size;
  BuildContext context;
  AppBarFriend(this.context, this.size)
      : super(
            preferredSize: Size.fromHeight(200),
            child: Container(
              //color: Colors.red,
              padding: EdgeInsets.all(size.width * 0.02),
              margin: EdgeInsets.only(top: size.width * 0.09),
              height: size.height * 0.13,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text('Bạn bè',
                          style: GoogleFonts.robotoFlex(
                              fontSize: size.height * 0.025,
                              fontWeight: FontWeight.w200,
                              color: Colors.white)),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: size.width * 0.07,
                      )
                    ],
                  ),
                  Gap(size.height * 0.015),
                  Row(
                    children: [
                      Gap(size.height * 0.015),
                      Container(
                        width: size.height * 0.12,
                        height: size.height * 0.035,
                        color: null,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Center(
                            child: Text(
                          'Gợi ý',
                          style: GoogleFonts.robotoFlex(color: Colors.white),
                        )),
                      ),
                      Gap(size.height * 0.02),
                      Container(
                        width: size.height * 0.12,
                        height: size.height * 0.035,
                          color: null,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Center(
                            child: Text('Bạn bè',
                                style: GoogleFonts.robotoFlex(
                                    color: Colors.white)),
                          ))
                    ],
                  ),
                ],
              ),
            ));
}
