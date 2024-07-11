import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/modules/chat/bloc/conversation/list_conversation_cubit.dart';
import 'package:flutter_app/modules/friend/bloc/list_friend_cubit.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            width: 100,
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
    return BaseScaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
          centerTitle: true,
          title: Text("Nhắn tin"),
          backgroundColor: Colors.transparent,
          elevation: 0,


        ),
        body: SafeArea(
            child: Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    margin: EdgeInsets.all(8),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Tìm kiếm bạn bè...'),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      height: 30,
                      width: 30,
                      child: Image.asset('assets/image/friends.png'),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: BlocBuilder<ListFriendCubit, ListFriendState>(
                  builder: (context, state) {
                    if (state is ListFriendLoadingState) {
                      return CircularProgressIndicator();
                    }
                    if (state is ListFriendLoadedState) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.lstFriend.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/profile.png')),
                                ),
                                Text(state.lstFriend.data![index].name ?? "")
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return SizedBox();
                  },
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child:
                    BlocBuilder<ListConversationCubit, ListConversationState>(
                  builder: (context, state) {
                    if (state is ListConversationLoadingState) {
                      return CircularProgressIndicator();
                    }
                    if (state is ListConversationLoadedState) {
                      return ListView.builder(
                        itemCount: state.lstConversation.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/profile.png')),
                                ),
                                Column(
                                  children: [
                                    Text(state
                                            .lstConversation
                                            .data![index]
                                            .grouAttachConvResList![0]
                                            .contactName ??
                                        ""),
                                    Text((state
                                                .lstConversation
                                                .data![index]
                                                .grouAttachConvResList![0]
                                                .lastMessageRes !=
                                            null)
                                        ? state
                                            .lstConversation
                                            .data![index]
                                            .grouAttachConvResList![0]
                                            .lastMessageRes!
                                            .content!
                                        : ""),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return SizedBox();
                  },
                ),
              ),
            ],
          ),
        )));
  }

  void openChatScreen(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(
      builder: (context) => ChatScreen(),
    ));
  }
}
