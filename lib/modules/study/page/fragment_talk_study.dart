// import 'package:flutter/material.dart';
// import 'package:flutter_app/modules/study/page/Sign.dart';
// import 'package:flutter_app/modules/study/page/alphabet.dart';
// import 'package:flutter_app/modules/study/page/customcard.dart';
// import 'package:flutter_app/modules/study/page/exam.dart';
// import 'package:flutter_app/modules/study/page/numbers.dart';
// import 'package:flutter_app/modules/study/page/study/study_topic.dart';
// import 'fragment_talk_upload.dart';

// final GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

// class TalkStudyScreen extends StatelessWidget {
//   const TalkStudyScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       //backgroundColor: Color.fromARGB(255, 224, 216, 243),
//       appBar: AppBar(
//         title: Text("Học tập"),
//         backgroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height:size.height*0.05),
//             Card(
//               margin: EdgeInsets.all(12.0),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Column(
//                 children: [
//                   SizedBox(height: size.height * 0.025),
//                   // Image.asset(
//                   //   'assets/images/ic_sign_language.png',
//                   //   height: 130.0,
//                   //   width: double.infinity,
//                   //   fit: BoxFit.cover,
//                   // ),
//                   // Padding(
//                   //   padding: const EdgeInsets.all(10.0),
//                   //   child: Column(
//                   //     children: [
//                   //       Row(
//                   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //         children: [
//                   //           Expanded(child: Text('Bảng chữ cái')),
//                   //           Icon(Icons.navigate_next, color: Colors.black), // Assuming you use Material icons
//                   //         ],
//                   //       ),
//                   //       Text('Học bảng chữ cái thông qua video'),
//                   //     ],
//                   //   ),
//                   // ),
//                   // Divider(),
//                   // Image.asset(
//                   //   'assets/images/ic_sign_number.jpg',
//                   //   height: 130.0,
//                   //   width: double.infinity,
//                   //   fit: BoxFit.cover,
//                   // ),
//                   // Padding(
//                   //   padding: const EdgeInsets.all(10.0),
//                   //   child: Column(
//                   //     children: [
//                   //       Row(
//                   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //         children: [
//                   //           Expanded(child: Text('Số đếm')),
//                   //           Icon(Icons.navigate_next, color: Colors.black), // Assuming you use Material icons
//                   //         ],
//                   //       ),
//                   //       Text('Học số đếm thông qua video'),
//                   //     ],
//                   //   ),
//                   // ),
//                   // Divider(),
//                   // Image.asset(
//                   //   'assets/images/ic_bar_sign.png',
//                   //   height: 130.0,
//                   //   width: double.infinity,
//                   //   fit: BoxFit.cover,
//                   // ),
//                   // Padding(
//                   //   padding: const EdgeInsets.all(10.0),
//                   //   child: Column(
//                   //     children: [
//                   //       Row(
//                   //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //         children: [
//                   //           Expanded(child: Text('Dấu trong tiếng Việt')),
//                   //           Icon(Icons.navigate_next, color: Colors.black), // Assuming you use Material icons
//                   //         ],
//                   //       ),
//                   //       Text('Học dấu thông qua video'),
//                   //     ],
//                   //   ),
//                   // ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       InkWell(
//                         child: CustomCard1(
//                           size: size,
//                           image: Image.asset('assets/images/alphabet.png'),
//                           title: "Chữ Cái",

//                           // statusOn: "OPEN",
//                           // statusOff: "LOCKED",
//                         ),
//                         onTap: () {
//                           Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => AlphabetScreen()),
//                         );
//                         },
//                       ),
//                       InkWell(
//                         child: CustomCard1(
//                           size: size,
//                           image: Image.asset('assets/images/number-blocks.png'),
//                           title: "Chữ số",
//                           // statusOn: "ON",
//                           // statusOff: "OFF",
//                         ),
//                         onTap: () {
//                           Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => NumberScreen()),
//                         );
//                         },
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: size.height * 0.025),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       InkWell(
//                         child: CustomCard1(
//                           size: size,
//                           image: Image.asset('assets/images/tilde.png'),
//                           title: "Dấu",
//                           // statusOn: "OPEN",
//                           // statusOff: "LOCKED",
//                         ),
//                         onTap: () {
//                           Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => SignScreen()),
//                         );
//                         },
//                       ),
//                       InkWell(
//                         child: CustomCard1(
//                           size: size,
//                           image: Image.asset('assets/images/cognitive.png'),
//                           title: "Kiểm tra",
//                           // statusOn: "ON",
//                           // statusOff: "OFF",
//                         ),
//                         onTap: () {
//                           Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ExamPage()),
//                         );
//                         },
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: size.height * 0.025),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       InkWell(
//                         child: CustomCard1(
//                           size: size,
//                           image: Image.asset('assets/images/hand.png'),
//                           title: "Luyện tay",

//                           // statusOn: "OPEN",
//                           // statusOff: "LOCKED",
//                         ),
//                         onTap: () {},
//                       ),
//                       InkWell(
//                         child: CustomCard1(
//                           size: size,
//                           image: Image.asset('assets/images/coming-soon.png'),
//                           title: "Sắp ra mắt",
//                           // statusOn: "ON",
//                           // statusOff: "OFF",
//                         ),
//                         onTap: () {
//                           Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => StudyTopic()),
//                         );
//                         },
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: size.height * 0.025),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   //   children: [
//                   //     InkWell(
//                   //       child: CustomCard(
//                   //         size: size,
//                   //         icon: Icon(
//                   //           UniconsLine.image_upload,
//                   //           size: 55,
//                   //           //color: Colors.grey.shade400,
//                   //         ),
//                   //         title: "Cung cấp",
//                   //         // statusOn: "DETECTED",
//                   //         // statusOff: "NOT DETECTED",
//                   //       ),
//                   //       onTap: () {

//                   //       },
//                   //     ),
//                   //     InkWell(
//                   //       child: CustomCard(
//                   //         size: size,
//                   //         icon: Icon(
//                   //           UniconsLine.cog,
//                   //           size: 55,
//                   //           //color: Colors.grey.shade400,
//                   //         ),
//                   //         title: "Công cụ",
//                   //         // statusOn: "ON",
//                   //         // statusOff: "OFF",
//                   //       ),
//                   //       onTap: () {

//                   //       },
//                   //     ),
//                   //   ],
//                   // ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             // Column(
//             //   children: [
//             //     Row(
//             //       children: [
//             //         Expanded(
//             //           child: GestureDetector(
//             //             onTap: () {
//             //               // Xử lý khi expanded đầu tiên được nhấn
//             //               Navigator.push(
//             //                 context,
//             //                 MaterialPageRoute(builder: (context) => Upload()),
//             //               );
//             //             },
//             //             child: Column(
//             //               children: [
//             //                 Image.asset(
//             //                   'assets/images/ontap.jpg',
//             //                   width: 50,
//             //                   height: 50,
//             //                   fit: BoxFit.cover,
//             //                 ),
//             //                 Text('Học Tập'),
//             //               ],
//             //             ),
//             //           ),
//             //         ),
//             //         Expanded(
//             //           child: Column(
//             //             children: [
//             //               Image.asset(
//             //                 'assets/images/cungcap.jpg',
//             //                 width: 50,
//             //                 height: 50,
//             //                 fit: BoxFit.cover,
//             //               ),
//             //               Text('Cung Cấp'),
//             //             ],
//             //           ),
//             //         ),
//             //         Expanded(
//             //           child: Column(
//             //             children: [
//             //               Image.asset(
//             //                 'assets/images/kho.jpg',
//             //                 width: 50,
//             //                 height: 50,
//             //                 fit: BoxFit.cover,
//             //               ),
//             //               Text('Kho'),
//             //             ],
//             //           ),
//             //         ),
//             //       ],
//             //     ),
//             //     SizedBox(
//             //       height: 30,
//             //     ),
//             //   ],
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }
