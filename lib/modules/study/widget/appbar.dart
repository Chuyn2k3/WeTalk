// import 'package:devquiz/core/core.dart';
// import 'package:devquiz/home/widgets/scorecard/score_card_widget.dart';
// import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_gradients.dart';
import 'package:flutter_app/data/term/text_style.dart';
import 'package:flutter_app/modules/study/widget/scorecard.dart';

class AppBarWidget extends PreferredSize {
  //final UserModel user;
  BuildContext context;
  AppBarWidget(
       this.context,
      )
      : super(
            preferredSize: Size.fromHeight(250),
            child: Container(
              height: 250,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(gradient: AppGradients.linear),
                    height: 161,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text.rich(
                          TextSpan(
                              text: "Hello, ",
                              //style: AppTextStyles.title,
                              children: [
                                TextSpan(
                                  text: 'chuyen',
                                )
                                //style: AppTextStyles.titleBold)
                              ]),
                        ),
                        Container(
                          height: 58,
                          width: 58,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage('assets/images/anh_CV.jpg')),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 1),
                    child: ScoreCardWidget(
                      percentage: 50 / 100,
                    ),
                  )
                ],
              ),
            ));
}
