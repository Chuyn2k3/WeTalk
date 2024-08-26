import 'package:flutter/material.dart';
import 'package:flutter_app/modules/search/cubit/search_user_cubit.dart';
import 'package:flutter_app/utils/input_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchUserScreen extends StatefulWidget {
  const SearchUserScreen({super.key});

  @override
  State<SearchUserScreen> createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  final TextEditingController _textEditingController = TextEditingController();

 
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InputTextField(
              hintText: "Nhập tên, email,... để tìm bạn bè",
              maxLine: 1,
              textAlign: TextAlign.left,
              textController: _textEditingController,
              decoration: InputDecoration(
                  constraints:
                      const BoxConstraints(maxHeight: 60, minHeight: 40),
                  contentPadding: const EdgeInsets.all(8),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              onChanged: (value) {
                context
                    .read<SearchUserCubit>()
                    .searchUser(_textEditingController.text);
              },
            ),
            BlocBuilder<SearchUserCubit, SearchUserState>(
              builder: (context, state) {
                if (state is SearchUserLoadedState) {
                  return ListView.builder(

                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
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
                                  : const AssetImage("assets/images/profile.png")as ImageProvider,
                            ),
                            const SizedBox(width: 8,),
                            Expanded(child: Text(data?.name ?? "")),
                            InkWell(
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: Image.asset("assets/icon/add-group.png")),
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
            )
          ],
        ),
      ),
    );
  }
}
