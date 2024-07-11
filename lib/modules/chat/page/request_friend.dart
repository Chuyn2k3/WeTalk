import 'package:flutter/material.dart';
import 'package:flutter_app/modules/friend/bloc/request_list_friend_cubit.dart';
import 'package:flutter_app/modules/friend/bloc/sending_list_friend_cubit.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestFriend extends StatefulWidget {
  const RequestFriend({super.key});

  @override
  State<RequestFriend> createState() => _RequestFriendState();
}

class _RequestFriendState extends State<RequestFriend> {
  int _selectedScreenIndex = 0;
  List<Widget> pages = [];

  @override
  void initState() {
    pages = [
      const GetRequest(),
      const SendingRequest(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> listItems = [
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

Widget bottomNavigationBar =
       BottomNavigationBar(
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
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          size: 18,
        ),
        centerTitle: true,
        title: Text("Lời mời kết bạn"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
          ),
          bottomNavigationBar
          // Row(
          //   children: [
          //     Expanded(
          //         child: GestureDetector(
          //       onTap: () {
          //         Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => const RequestFriend(),
          //             ));
          //       },
          //       child: Row(
          //         children: [
          //           SizedBox(
          //             height: 20,
          //             width: 20,
          //             child: Image.asset('assets/image/question.png'),
          //           ),
          //           Text('Lời mời')
          //         ],
          //       ),
          //     )),
          //     VerticalDivider(
          //       color: Colors.black,
          //       width: 1,
          //       thickness: 2,
          //     ),
          //     Expanded(
          //         child: Row(
          //       children: [
          //         SizedBox(
          //           height: 20,
          //           width: 20,
          //           child: Image.asset('assets/image/envelope.png'),
          //         ),
          //         Text('Đã gửi')
          //       ],
          //     )),
          //   ],
          // )
        ],
      )),
    );
  }
}

class GetRequest extends StatelessWidget {
  const GetRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestListFriendCubit, RequestListFriendState>(
      builder: (context, state) {
        if (state is RequestListFriendLoadingState) {
          return const CircularProgressIndicator();
        } else if (state is RequestListFriendLoadedState) {
          return ListView.builder(
            itemCount: state.lstRequestFriend.data?.length ?? 0,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Image.asset('assets/images/profile.png'),
                    ),
                    Column(
                      children: [
                        Text(state.lstRequestFriend.data?[index].name ?? ""),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: () {}, child: Text('Chấp nhận')),
                            ElevatedButton(
                                onPressed: () {}, child: Text('Hủy')),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class SendingRequest extends StatelessWidget {
  const SendingRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendingListFriendCubit, SendingListFriendState>(
      builder: (context, state) {
        if (state is SendingListFriendLoadingState) {
          return const CircularProgressIndicator();
        } else if (state is SendingListFriendLoadedState) {
          return ListView.builder(
            itemCount: state.lstSendingFriend.data?.length ?? 0,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Image.asset('assets/images/profile.png'),
                    ),
                    Column(
                      children: [
                        Text(state.lstSendingFriend.data?[index].name ?? ""),
                        ElevatedButton(
                            onPressed: () {}, child: const Text('Hủy'))
                      ],
                    )
                  ],
                ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
