import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/modules/chat/bloc/conversation/list_conversation_cubit.dart';
import 'package:flutter_app/modules/friend/bloc/list_friend_cubit.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'fragment_talk_chat_home.dart';

final GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class ChatMainScreen extends StatefulWidget {
  static String routeName = 'chat_screen';
  const ChatMainScreen({super.key});
  @override
  _ChatMainScreenState createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {
  FocusNode _focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseScaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Nhắn tin",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            height: size.height * 0.08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      focusNode: _focusNode,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              )),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Tìm kiếm bạn bè...'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: SizedBox(
                      height: 35,
                      width: 35,
                      child: Image.asset('assets/image/friends.png'),
                    ),
                  ),
                )
              ],
            ),
          ),
          Visibility(
            visible: !isFocused,
            child: Flexible(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    child: BlocBuilder<ListFriendCubit, ListFriendState>(
                      builder: (context, state) {
                        if (state is ListFriendLoadingState) {
                          return const CircularProgressIndicator();
                        }
                        if (state is ListFriendLoadedState) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.lstFriend.data!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Column(
                                  children: [
                                    const CircleAvatar(
                                      radius: 30,
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/profile.png')),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                        state.lstFriend.data![index].name ?? "")
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
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: BlocBuilder<ListConversationCubit, ListConversationState>(
              builder: (context, state) {
                if (state is ListConversationLoadingState) {
                  return const CircularProgressIndicator();
                }
                if (state is ListConversationLoadedState) {
                  return ListView.builder(
                    itemCount: state.lstConversation.data?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Colors.white),
                          child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                radius: 35,
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/profile.png')),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state
                                            .lstConversation
                                            .data?[index]
                                            .grouAttachConvResList![0]
                                            .contactName ??
                                        "",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    (state
                                                .lstConversation
                                                .data?[index]
                                                .grouAttachConvResList![0]
                                                .lastMessageRes !=
                                            null)
                                        ? state
                                            .lstConversation
                                            .data![index]
                                            .grouAttachConvResList![0]
                                            .lastMessageRes!
                                            .content!
                                        : "",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey),
                                    overflow: TextOverflow.clip,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return SizedBox();
              },
            ),
          ),
        ]));
  }

  void openChatScreen(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(
      builder: (context) => const ChatScreen(),
    ));
  }
}
