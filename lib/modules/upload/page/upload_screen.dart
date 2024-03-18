import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/upload/widget/appbar_widget.dart';
import 'package:flutter_app/modules/upload/widget/centerPopUp.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class UpLoad extends StatefulWidget {
  const UpLoad({super.key});

  @override
  State<UpLoad> createState() => _UpLoadState();
}

class _UpLoadState extends State<UpLoad> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 234, 227, 227),
        appBar: uploadAppBar(),
        body: Stack(
          children: [
            Positioned(
              top: size.height * 0.025,
              left: size.width * 0.03,
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Gap(10),
                      Text('05/03/2024'),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_drop_down_outlined))
                    ]),
              ),
            ),
            Positioned(
              top: 20,
              right: size.width * 0.1,
              child: InkWell(
                child: Container(
                  width: size.width * 0.35,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color:  Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //Gap(10),

                        Image.asset('assets/images/price-tag.ico', width: 47),
                        Text(
                          'Nội dung',
                          style: TextStyle(fontSize: 16),
                        ),
                      ]),
                ),
                onTap: () {
                  showCenteredPopup(context, YourPopupContentWidget());
                },
              ),
            ),
            Positioned(
              top: size.height * 0.2,
              left: size.width * 0.05,
              child: Container(
                  height: size.height * 0.4,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Video cung cấp của bạn',
                          style: TextStyle(
                              color: Color.fromARGB(255, 21, 78, 177))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Image.asset('assets/images/video_call.png')],
                      ),
                      Divider(
                        color: Colors.black,
                        height: 0.9,
                        thickness: 0.2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.camera,
                                    color: Color.fromARGB(255, 21, 78, 177)),
                                Gap(20),
                                Text("Quay video",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 21, 78, 177)))
                              ],
                            ),
                          ),
                          InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.image,
                                    color: Color.fromARGB(255, 21, 78, 177)),
                                Gap(20),
                                Text("Ảnh/video",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 21, 78, 177)))
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),
            Positioned(
                bottom: size.height * 0.15,
                right: size.width * 0.05,
                child: Container(
                  width: size.width * 0.9,
                  height: size.width * 0.2,
                  transformAlignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          width: 5,
                          color: Color.fromARGB(255, 106, 80, 255),
                          style: BorderStyle.solid)),
                  child: Center(
                    child: InkWell(
                      child: Text('Xem video hướng dẫn',
                          style: GoogleFonts.lato(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 61, 34, 218))),
                    ),
                  ),
                ))
          ],
        )
        // Column(
        //   children: [
        //     Row(
        //       children: [
        //         Container(
        //           margin: EdgeInsets.all(20),
        //           decoration: BoxDecoration(
        //               color: const Color.fromARGB(255, 232, 226, 226),
        //               borderRadius: BorderRadius.all(Radius.circular(10))),
        //           child: Row(children: [
        //             Text('05/03/2024'),
        //             IconButton(
        //                 onPressed: () {},
        //                 icon: Icon(Icons.arrow_drop_down_outlined))
        //           ]),
        //         ),
        //         SizedBox(
        //           width: size.width * 0.02,
        //         ),
        //         InkWell(
        //           child: Container(
        //             margin: EdgeInsets.all(20),
        //             decoration: BoxDecoration(
        //                 color: const Color.fromARGB(255, 232, 226, 226),
        //                 borderRadius: BorderRadius.all(Radius.circular(10))),
        //             child: Row(children: [
        //               Image.asset('assets/images/price-tag.ico', width: 45),
        //               Text('Nội dung'),
        //             ]),
        //           ),
        //           onTap: () {
        //             showCenteredPopup(context, YourPopupContentWidget());
        //           },
        //         ),
        //       ],
        //     ),
        //     Container(
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.all(Radius.circular(10))),
        //         child: Column(
        //           children: [
        //             Text('video'),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [Image.asset('assets/images/video_call.png')],
        //             ),
        //             Divider(
        //               height: 0.8,
        //               thickness: 0.1,
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //               children: [
        //                 InkWell(
        //                   child: Row(
        //                     children: [Icon(Icons.camera), Text("Quay video")],
        //                   ),
        //                 ),
        //                 InkWell(
        //                   child: Row(
        //                     children: [Icon(Icons.image), Text("Kho")],
        //                   ),
        //                 )
        //               ],
        //             )
        //           ],
        //         )),
        //     Container(
        //       transformAlignment: Alignment.center,
        //       decoration: BoxDecoration(
        //           border: Border.all(
        //               width: 8,
        //               color: Colors.purple,
        //               style: BorderStyle.solid)),
        //       child: InkWell(
        //         child: Text('Xem video'),
        //       ),
        //     )
        //   ],
        // )
        );
  }
}
