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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseScaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
          centerTitle: true,
          title: const Text("Bạn bè"),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            InkWell(
              onTap: () {},
              child: SizedBox(
                child: Image.asset('assets/image/friend.png'),
              ),
            )
          ],
        ),
        body: SafeArea(
            child: Expanded(
          child: Column(
            children: [
              Container(
                height: 50,
                width: 100,
                margin: const EdgeInsets.all(8),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Tìm kiếm bạn bè...'),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: BlocBuilder<ListFriendCubit, ListFriendState>(
                  builder: (context, state) {
                    if (state is ListFriendLoadingState) {
                      return const CircularProgressIndicator();
                    }
                    if (state is ListFriendLoadedState) {
                      return ListView.builder(
                        itemCount: state.lstFriend.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                 CircleAvatar(
                              radius: 30,
                              backgroundImage: state.lstFriend.data?[index]
                                        .avatarLocation != null
                                  ? NetworkImage(state.lstFriend.data![index]
                                        .avatarLocation!)
                                  : const AssetImage("assets/images/profile.png")as ImageProvider,
                            ),
                                Column(
                                  children: [
                                    Text(state.lstFriend.data![index].name ??
                                        ""),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        )));
  }
}
