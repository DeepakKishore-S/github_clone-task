import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_clone/features/authentication/model/user/user.dart';
import 'package:github_clone/features/home/model/organization_data/organization_data.dart';
import 'package:github_clone/features/home/model_view/bloc/home_bloc.dart';
import 'package:github_clone/utils/app_theme.dart';
import 'package:github_clone/utils/strings.dart';

import '../features/authentication/model_view/bloc/authentication_bloc.dart';

Drawer appDrawer({
  required BuildContext context,
  required double height,
}) {
  UserData? userData = context.read<AuthenticationBloc>().user;
  List<OrganizationData> organizations = context.read<HomeBloc>().organizations;
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: height * 0.2,
          child: DrawerHeader(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  "https://images.unsplash.com/photo-1499155286265-79a9dc9c6380?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=684&q=80",
                  height: 50.0,
                  width: 50.0,
                  fit: BoxFit.cover,
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  userData!.name ?? "User",
                  style: AppTextStyle.headerText,
                ),
              ),
              subtitle: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.yellow[800],
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      userData.name!,
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
        ListView.builder(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          itemCount: organizations.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                context.read<HomeBloc>().add(
                      SelectOrganizationEvent(
                        selectedIndex: index,
                        token: context.read<AuthenticationBloc>().accessToken!,
                      ),
                    );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: context.read<HomeBloc>().selectedOrganizationIndex ==
                            index
                        ? AppColors.primaryColor[100]
                        : Colors.white,
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          organizations[index].avatarUrl!,
                          height: 50.0,
                          width: 50.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          organizations[index].login ?? "",
                          style: AppTextStyle.headerText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        // const SizedBox(
        //   height: 20,
        // ),
        ListTile(
          leading: Card(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: const Icon(
                  Icons.login,
                  size: 35,
                ),
              ),
            ),
          ),
          title: const Text(
            'Logout',
            style: AppTextStyle.subHeaderText,
          ),
          onTap: () {
            Navigator.pop(context);
            context.read<HomeBloc>().add(
                  const LogOutEvent(),
                );
          },
        ),
      ],
    ),
  );
}
