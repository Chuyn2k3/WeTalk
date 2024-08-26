import 'package:flutter/material.dart';
import 'package:flutter_app/gen/assets.gen.dart';
import 'package:flutter_app/modules/personal/bloc/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CircularProfile extends StatelessWidget {
  const CircularProfile({super.key});

  @override
  Widget build(BuildContext context) {
    String? avatarLink;
    final state = context.read<UserInfoCubit>().state;
    if (state is UserInfoLoadedState) {
      avatarLink = (state).user.data?.avatarLocation??"";
    }

    return InkWell(
      child: CircleAvatar(
        radius:64,
        backgroundImage: avatarLink != null
            ? NetworkImage(avatarLink)
            : const AssetImage("assets/images/profile.png")as ImageProvider,
      ),
    );
  }
}
