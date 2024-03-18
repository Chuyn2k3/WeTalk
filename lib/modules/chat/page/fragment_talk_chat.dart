import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'fragment_talk_chat_home.dart';

final GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class ChatMainScreen extends StatefulWidget {
  static String routeName = 'chat_screen';
  const ChatMainScreen({super.key});
  @override
  _ChatMainScreenState createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {
  Widget topBar(Size size) {
    return Row(
      children: [
        BackButton(color: Colors.white),
        Expanded(
          child: Container(
            //padding: const EdgeInsets.symmetric(horizontal: 10),
            height: size.width * 0.11,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),

            child: TextFormField(
              //cursorHeight: 15,

              ///onChanged: search,
              //maxLength: 500,
              //expands: true,
              //controller: _textEditingController,
              decoration: const InputDecoration(
                //filled: true,
                //fillColor: AppColors.white2,
                // contentPadding:
                //     EdgeInsets.symmetric(vertical: 5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(width: 0.8),
                ),
                hintText: 'Tìm kiếm.......',
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
                // enabledBorder: OutlineInputBorder(
                //   borderRadius:
                //       BorderRadius.all(Radius.circular(30)),
                //   borderSide: BorderSide(width: 0.8),
                // ),
                // focusedBorder: UnderlineInputBorder(
                //   borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(30),
                //       bottomLeft: Radius.circular(30)),
                //   borderSide: BorderSide(
                //     width: 4,
                //     color: Colors.blue,
                //   ),
                // )
              ),
            ),
            // Row(
            //   children: [
            //     Icon(
            //       Icons.search,
            //       size: 30,
            //       color: Color.fromARGB(255, 128, 128, 128),
            //     ),
            //     Gap(size.width*0.01),
            //     TextFormField(
            //                 //cursorHeight: 15,

            //                 ///onChanged: search,
            //                 //maxLength: 500,
            //                 //expands: true,
            //                 //controller: _textEditingController,
            //                 decoration: const InputDecoration(

            //                     //filled: true,
            //                     //fillColor: AppColors.white2,
            //                     // contentPadding:
            //                     //     EdgeInsets.symmetric(vertical: 5),
            //                     border: OutlineInputBorder(
            //                       borderRadius:
            //                           BorderRadius.all(Radius.circular(10)),
            //                       borderSide: BorderSide(width: 0.8),
            //                     ),
            //                     hintText: 'Tìm kiếm',
            //                     prefixIcon: Icon(
            //                       Icons.search,
            //                       size: 30,
            //                     ),
            //                     // enabledBorder: OutlineInputBorder(
            //                     //   borderRadius:
            //                     //       BorderRadius.all(Radius.circular(30)),
            //                     //   borderSide: BorderSide(width: 0.8),
            //                     // ),
            //                     // focusedBorder: UnderlineInputBorder(
            //                     //   borderRadius: BorderRadius.only(
            //                     //       topLeft: Radius.circular(30),
            //                     //       bottomLeft: Radius.circular(30)),
            //                     //   borderSide: BorderSide(
            //                     //     width: 4,
            //                     //     color: Colors.blue,
            //                     //   ),
            //                     // )
            //                     ),
            //               ),
            //     // Text(
            //     //   "Search message...",
            //     //   style: TextStyle(
            //     //     fontSize: 18,
            //     //     color: Color.fromARGB(255, 128, 128, 128),
            //     //   ),
            //     // ),
            //   ],
            // ),
          ),
        ),
        const Gap(15),
        Container(
          width: size.width * 0.11,
          height: size.width * 0.11,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.edit_square,
            size: 30,
            color: Color.fromARGB(255, 128, 128, 128),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        //color: const Color.fromARGB(255, 241, 241, 241),
        color: Color.fromARGB(255, 43, 41, 41),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: size.width * 0.11,
                bottom: 5,
                right: 20,
                left: 20,
              ),
              child: topBar(size),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                  bottom: 5,
                ),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        openChatScreen(context);
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        height: size.height * 0.1,
                        width: size.height * 0.2,
                        //constraints: ,
                        decoration: BoxDecoration(
                            //color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                        //color: Colors.black,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                                //backgroundColor: Colors.white,
                                //foregroundColor: Colors.white,
                                backgroundImage:
                                    AssetImage('assets/images/anh_CV.jpg'),
                                radius: 50),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Chuyên $index',
                                      style: GoogleFonts.lato(
                                          fontSize: size.width * 0.05,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey)),
                                  Text('Đã gửi tin nhắn cho bạn $index',
                                      style: GoogleFonts.lato(
                                          fontSize: size.width * 0.04,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey))
                                ])
                            // ListTile(
                            //   title: Text('User $index'),
                            //   subtitle: Text('Last message $index'),
                            //   onTap: () {
                            //     openChatScreen(context);
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    );
                    // Container(
                    //   child: Row(
                    //     children: [
                    //       CircleAvatar(
                    //           child:
                    //               Image.asset('assets/images/profile.png')),
                    //       ListTile(
                    //         title: Text('User $index'),
                    //         subtitle: Text('Last message $index'),
                    //         onTap: () {
                    //           openChatScreen(context);
                    //         },
                    //       ),
                    //     ],
                    //   ),
                    // );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      // appBar: AppBar(
      //   title: Text("Tin nhắn"),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.search),
      //       onPressed: () {
      //         // Handle search button press
      //       },
      //     ),
      //     IconButton(
      //       icon: Icon(Icons.menu),
      //       onPressed: () {
      //         // Handle menu button press
      //       },
      //     ),
      //   ],
      // ),
      // body: Column(
      //   children: [
      //     Expanded(
      //       child: Container(
      //         padding: EdgeInsets.all(8.0),
      //         child: ListView.builder(
      //           itemCount: 10,
      //           itemBuilder: (context, index) {
      //             return ListTile(
      //               title: Text('User $index'),
      //               subtitle: Text('Last message $index'),
      //               onTap: () {
      //                 openChatScreen(context);
      //               },
      //             );
      //           },
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

void openChatScreen(BuildContext context) {
  Navigator.of(
    context,
  ).push(MaterialPageRoute(
    builder: (context) => ChatScreen(),
  ));
}
