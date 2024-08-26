import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/modules/personal/bloc/user_cubit.dart';
import 'package:flutter_app/utils/common_app.dart';
import 'package:flutter_app/utils/input_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        if (state is UserInfoLoadingState) {
          return const CircularProgressIndicator();
        }
        if (state is UserInfoLoadedState) {
          return Container(
            margin: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: state.user.data?.avatarLocation != null
                      ? NetworkImage(state.user.data!.avatarLocation!)
                      : const AssetImage("assets/images/profile.png")
                          as ImageProvider,
                ),
                const SizedBox(
                  width: 4,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Xin chào, ${state.user.data?.name ?? ""}',style: textTheme.t16M,),
                    SizedBox(
                      height: 35,
                      width: size.width * 0.6,
                      child: TextFormField(
                        controller: _textEditingController1,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(4),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(width: 0.8),
                            ),
                            hintText: 'Tìm kiếm...',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.search,
                              size: 30,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }
        return Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              CircleAvatar(
                  radius: 40, child: Image.asset('assets/images/profile.png')),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Xin chào,',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      height: 38,
                      //width: 140,
                      child: TextFormField(
                        controller: _textEditingController1,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(4),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(width: 0.8),
                            ),
                            hintText: 'Tìm kiếm...',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.search,
                              size: 30,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
