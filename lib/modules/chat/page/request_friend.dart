import 'package:design_system_sl/design_system_sl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/term/app_colors.dart';
import 'package:flutter_app/modules/chat/page/search_friend.dart';
import 'package:flutter_app/modules/friend/bloc/accept_friend_cubit.dart';
import 'package:flutter_app/modules/friend/bloc/request_list_friend_cubit.dart';
import 'package:flutter_app/modules/friend/bloc/sending_list_friend_cubit.dart';
import 'package:flutter_app/modules/search/cubit/search_user_cubit.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';
import 'package:flutter_app/utils/snack_bar.dart';
import 'package:flutter_app/widget/circular_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestFriend extends StatefulWidget {
  const RequestFriend({super.key});

  @override
  State<RequestFriend> createState() => _RequestFriendState();
}

class _RequestFriendState extends State<RequestFriend> {
  int _selectedScreenIndex = 0;
  List<Widget> pages = [];
  late SendingListFriendCubit sendingListFriendCubit;
  late RequestListFriendCubit requestListFriendCubit;
  //late SearchUserCubit searchUserCubit;
  @override
  void initState() {
    pages = [
      //const SearchUserScreen(),
      const SendingRequest(),
      const GetRequest(),
    ];
    sendingListFriendCubit = SendingListFriendCubit();
    requestListFriendCubit = RequestListFriendCubit();
    //searchUserCubit = SearchUserCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> listItems = [
      // BottomNavigationBarItem(
      //     icon: SizedBox(
      //         height: 30,
      //         width: 30,
      //         child: Image.asset(
      //           'assets/icon/search-user.png',
      //         )),
      //     activeIcon: SizedBox(
      //         height: 30,
      //         width: 30,
      //         child: Image.asset(
      //           'assets/icon/search-user.png',
      //           color: Colors.blue,
      //         )),
      //     label: "Đã gửi",
      //     backgroundColor: Colors.transparent),
      BottomNavigationBarItem(
          icon: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                'assets/image/question.png',
              )),
          activeIcon: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                'assets/image/question.png',
                color: Colors.blue,
              )),
          label: "Lời mời",
          backgroundColor: Colors.transparent),
      BottomNavigationBarItem(
          icon: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                'assets/image/envelope.png',
              )),
          activeIcon: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                'assets/image/envelope.png',
                color: Colors.blue,
              )),
          label: "Đã gửi",
          backgroundColor: Colors.transparent),
    ];

    Widget bottomNavigationBar = BottomNavigationBar(
      currentIndex: _selectedScreenIndex,
      onTap: (index) {
        setState(() {
          _selectedScreenIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      selectedItemColor: Colors.blue[500],
      unselectedItemColor: Colors.grey[500],
      showUnselectedLabels: true,
      items: listItems,
    );

    return BaseScaffold(
      appBar: CustomAppbar.basic(
        isLeading: true,
        title: "Lời mời kết bạn",
        onTap: () => Navigator.pop(context),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sendingListFriendCubit..getSendingListFriend(),
          ),
          BlocProvider(
            create: (context) => requestListFriendCubit..getRequestListFriend(),
          ),
          // BlocProvider(
          //   create: (context) => searchUserCubit,
          // )
        ],
        child: Column(
          children: [bottomNavigationBar, pages[_selectedScreenIndex]],
        ),
      ),
    );
  }
}

class GetRequest extends StatefulWidget {
  const GetRequest({super.key});

  @override
  State<GetRequest> createState() => _GetRequestState();
}

class _GetRequestState extends State<GetRequest> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestListFriendCubit, RequestListFriendState>(
      builder: (context, state) {
        if (state is RequestListFriendLoadingState) {
          return const CircularIndicator();
        } else if (state is RequestListFriendLoadedState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListView.builder(
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,
                  itemCount: state.lstRequestFriend.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.whiteColor),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: state.lstRequestFriend.data?[index]
                                        .avatarLocation !=
                                    null
                                ? NetworkImage(state.lstRequestFriend
                                    .data?[index].avatarLocation)
                                : const AssetImage("assets/images/profile.png")
                                    as ImageProvider,
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.lstRequestFriend.data?[index].name ?? "",
                                style: SLStyle.t18M,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SLButton.brand(
                                onTap: () async {},
                                label: "Hủy",
                                size: SLSize.large,
                                isRounded: true,
                                isOuline: true,
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }
        return const Center(child: Text("N/A"));
      },
    );
  }
}

class SendingRequest extends StatefulWidget {
  const SendingRequest({super.key});

  @override
  State<SendingRequest> createState() => _SendingRequestState();
}

class _SendingRequestState extends State<SendingRequest> {
  AcceptFriendCubit acceptFriendCubit = AcceptFriendCubit();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => acceptFriendCubit,
        ),
      ],
      child: BlocListener<AcceptFriendCubit, AcceptFriendState>(
        listener: (context, state) {
          if (state is AcceptFriendLoadedState) {
            context.showSnackBarSuccess(text: "Thêm bạn thành công");
          }
          if (state is AcceptFriendErrorState) {
            context.showSnackBarFail(text: "Có lỗi xảy ra");
          }
        },
        child: BlocBuilder<SendingListFriendCubit, SendingListFriendState>(
          builder: (context, state) {
            if (state is SendingListFriendLoadingState) {
              return const CircularIndicator();
            } else if (state is SendingListFriendLoadedState) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListView.builder(
                      padding: const EdgeInsets.all(8),
                      shrinkWrap: true,
                      itemCount: state.lstSendingFriend.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColors.whiteColor),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: state.lstSendingFriend
                                            .data?[index].avatarLocation !=
                                        null
                                    ? NetworkImage(state.lstSendingFriend
                                        .data?[index].avatarLocation)
                                    : const AssetImage(
                                            "assets/images/profile.png")
                                        as ImageProvider,
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.lstSendingFriend.data?[index].name ??
                                        "",
                                    style: SLStyle.t18M,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      SLButton.brand(
                                        onTap: () {
                                          acceptFriendCubit.acceptFriend(state
                                                  .lstSendingFriend
                                                  .data![index]
                                                  .userId ??
                                              0);
                                        },
                                        label: "Đồng ý",
                                        size: SLSize.medium,
                                        isRounded: true,
                                      ),
                                      const SizedBox(
                                        width: 24,
                                      ),
                                      SLButton.brand(
                                        onTap: () async {},
                                        label: "Hủy",
                                        size: SLSize.medium,
                                        isRounded: true,
                                        isOuline: true,
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }
            return const Center(child: Text("N/A"));
          },
        ),
      ),
    );
  }
}
