import 'dart:math' as math;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:github_clone/features/authentication/model/user/user.dart';
import 'package:github_clone/features/authentication/model_view/bloc/authentication_bloc.dart';
import 'package:github_clone/utils/app_theme.dart';
import 'package:github_clone/utils/strings.dart';

class HomeHeaderWidget extends HookWidget {
  HomeHeaderWidget({
    super.key,
    required this.height,
    required GlobalKey<ScaffoldState> globalKey,
  }) : _key = globalKey;

  final double height;
  final GlobalKey<ScaffoldState> _key;
  UserData? userData;
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      userData = context.read<AuthenticationBloc>().user;
      return;
    });
    return SizedBox(
      height: height * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => _key.currentState!.openDrawer(),
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  "Github",
                  style: AppTextStyle.titleText,
                ),
              ),
              const Spacer(),
              Transform.rotate(
                angle: math.pi / 5.0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_outlined,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8,
            ),
            child: Text(
              "Hi ${userData!.name!}",
              style: AppTextStyle.titleText,
            ),
          ),
        ],
      ),
    );
  }
}
