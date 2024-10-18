import 'package:flutter/material.dart';
import 'package:flutter_app/modules/friend/bloc/add_friend_cubit.dart';
import 'package:flutter_app/modules/search/cubit/search_user_cubit.dart';
import 'package:flutter_app/utils/base_scaffold.dart';
import 'package:flutter_app/utils/custom_app_bar.dart';
import 'package:flutter_app/utils/input_text_field.dart';
import 'package:flutter_app/utils/snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchUserScreen extends StatefulWidget {
  const SearchUserScreen({super.key});

  @override
  State<SearchUserScreen> createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  SearchUserCubit searchUserCubit = SearchUserCubit();
  AddFriendCubit addFriendCubit = AddFriendCubit();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => searchUserCubit,
        ),
        BlocProvider(
          create: (context) => addFriendCubit,
        )
      ],
      child: BaseScaffold(
        appBar: CustomAppbar.basic(
          isLeading: true,
          onTap: Navigator.of(context).pop,
          actions: [
            const Expanded(
                child: SizedBox(
              width: 8,
            )),
            Expanded(
              flex: 4,
              child: LayoutBuilder(builder: (context, constraints) {
                return SizedBox(
                  height: 38,
                  //width: 150,
                  child: InputTextField(
                    autoFocus: true,
                    onChanged: (value) {
                      searchUserCubit.searchUser(_textEditingController.text);
                    },
                    textController: _textEditingController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Tìm kiếm người dùng',
                        contentPadding: const EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 110, 107, 107)),
                        focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(162))),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 233, 231, 231),
                                width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        disabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                    maxLine: 1,
                    textAlign: TextAlign.left,
                    ontap: () {},
                  ),
                );
              }),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocListener<AddFriendCubit, AddFriendState>(
            listener: (context, state) {
              if (state is AddFriendLoadedState) {
                context.showSnackBarSuccess(text: "Đã gửi lời mời kết bạn");
              }
              if (state is AddFriendErrorState) {
                context.showSnackBarFail(text: "Thất bại, thử lại sau");
              }
            },
            child: BlocBuilder<SearchUserCubit, SearchUserState>(
              builder: (context, state) {
                if (state is SearchUserLoadedState) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    //shrinkWrap: true,
                    itemCount: state.searchUser.data?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final data = state.searchUser.data?.data?[index];
                      return Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: data?.avatarLocation != null
                                  ? NetworkImage(data?.avatarLocation)
                                  : const AssetImage(
                                          "assets/images/profile.png")
                                      as ImageProvider,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(child: Text(data?.name ?? "")),
                            InkWell(
                              onTap: () =>
                                  addFriendCubit.addFriend(data!.userId!),
                              child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child:
                                      Image.asset("assets/icon/add-group.png")),
                            )
                          ],
                        ),
                      );
                    },
                  );
                } else if (state is SearchUserErrorState) {
                  return const Center(
                    child: Text("N/A"),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
