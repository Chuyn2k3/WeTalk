import 'package:flutter/material.dart';
import 'package:flutter_app/modules/chat/bloc/conversation/list_conversation_cubit.dart';
import 'package:flutter_app/modules/chat/page/request_friend.dart';
import 'package:flutter_app/modules/chat/page/search_friend.dart';
import 'package:flutter_app/modules/friend/bloc/list_friend_cubit.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';
import 'package:flutter_app/widget/circular_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatMainScreen extends StatefulWidget {
  static String routeName = 'chat_screen';
  const ChatMainScreen({super.key});
  @override
  State<ChatMainScreen> createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {
  final FocusNode _focusNode = FocusNode();
  bool isFocused = false;
  ListFriendCubit listFriendCubit = ListFriendCubit();
  ListConversationCubit listConversationCubit = ListConversationCubit();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListFriendCubit>(
          create: (BuildContext context) => listFriendCubit..getListFriend(),
        ),
        BlocProvider<ListConversationCubit>(
          create: (BuildContext context) =>
              listConversationCubit..getListConversation(),
        ),
      ],
      child: BaseScaffold(
          appBar: CustomAppbar.basic(
            onTap: () => Navigator.pop(context),
            isLeading: true,
            title: "Nhắn tin",
          ),
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: LayoutBuilder(builder: (context, constraints) {
                        return SizedBox(
                          height: 38,
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SearchUserScreen(),
                                )),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              //margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.search,
                                      color: Colors.grey), // Icon tìm kiếm
                                  SizedBox(width: 8),
                                  Text(
                                    "Tìm kiếm bạn bè...", // Văn bản mặc định
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 110, 107, 107)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RequestFriend(),
                            ));
                      },
                      child: SizedBox(
                        height: 35,
                        width: 35,
                        child: Image.asset('assets/image/friends.png'),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 90,
                  child: Column(
                    children: [
                      Expanded(
                        child: BlocBuilder<ListFriendCubit, ListFriendState>(
                          builder: (context, state) {
                            if (state is ListFriendLoadingState) {
                              return const Center(child: CircularIndicator());
                            }
                            if (state is ListFriendLoadedState) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.lstFriend.data?.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundImage: state
                                                      .lstFriend
                                                      .data![index]
                                                      .avatarLocation !=
                                                  null
                                              ? NetworkImage(state.lstFriend
                                                  .data![index].avatarLocation!)
                                              : const AssetImage(
                                                      "assets/images/profile.png")
                                                  as ImageProvider,
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                            state.lstFriend.data![index].name ??
                                                "")
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
                Expanded(
                  flex: 6,
                  child:
                      BlocBuilder<ListConversationCubit, ListConversationState>(
                    builder: (context, state) {
                      if (state is ListConversationLoadingState) {
                        return const Center(child: CircularIndicator());
                      }
                      if (state is ListConversationLoadedState) {
                        final data = state.lstConversation.data;
                        if (data != null) {
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: state.lstConversation.data?.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      color: Colors.white),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundImage: data[index]
                                                    .grouAttachConvResList?[0]
                                                    .avatarLocation !=
                                                null
                                            ? NetworkImage(state
                                                .lstConversation
                                                .data![index]
                                                .grouAttachConvResList![0]
                                                .avatarLocation!)
                                            : const AssetImage(
                                                    "assets/images/profile.png")
                                                as ImageProvider,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[index]
                                                    .grouAttachConvResList![0]
                                                    .contactName ??
                                                "",
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            (data[index]
                                                        .grouAttachConvResList![
                                                            0]
                                                        .lastMessageRes !=
                                                    null)
                                                ? data[index]
                                                    .grouAttachConvResList![0]
                                                    .lastMessageRes!
                                                    .content!
                                                : "",
                                            style: const TextStyle(
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
                        return Text("N/A");
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ])),
    );
  }
}
