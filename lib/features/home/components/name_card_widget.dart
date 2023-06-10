import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:github_clone/features/authentication/model/user/user.dart';
import 'package:github_clone/features/authentication/model_view/bloc/authentication_bloc.dart';
import 'package:github_clone/features/home/model_view/bloc/home_bloc.dart';
import 'package:github_clone/utils/app_theme.dart';
import 'package:github_clone/utils/strings.dart';

class NameCardWidget extends HookWidget {
  final double height;
  final double width;
  NameCardWidget({super.key, required this.height, required this.width});
  UserData? userData;
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      userData = context.read<AuthenticationBloc>().user;
      return;
    });
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 16, 44),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                userData!.profilePicture!,
                height: 60.0,
                width: 50.0,
                fit: BoxFit.cover,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                userData!.userName!,
                style: AppTextStyle.headerText,
              ),
            ),
            subtitle: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.tealAccent[400],
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    context.read<HomeBloc>().organizations.isEmpty
                        ? ""
                        : context
                            .read<HomeBloc>()
                            .organizations[context
                                .read<HomeBloc>()
                                .selectedOrganizationIndex!]
                            .login!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
