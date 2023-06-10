import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:github_clone/features/home/model/organization_repository/organization_repository.dart';
import 'package:github_clone/features/home/model_view/bloc/home_bloc.dart';
import 'package:github_clone/utils/app_theme.dart';

class HomeBodyWidget extends HookWidget {
  HomeBodyWidget({
    super.key,
    required this.height,
  });

  final double height;
  List<OrganizationRepository> repositories = [];
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      repositories = context.read<HomeBloc>().organizationRepository;
    });
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.maxFinite,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            const Text(
              "Projects",
              style: AppTextStyle.headerText,
            ),
            const SizedBox(
              height: 12,
            ),
            repositories.isEmpty
                ? const Center(
                    child: Text("No Reporsitory"),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: repositories.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ListTile(
                            onTap: () {
                              context.read<HomeBloc>().add(
                                    GoToProjectViewEvent(
                                      index,
                                    ),
                                  );
                            },
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                repositories[index].owner!.avatarUrl!,
                                height: 40.0,
                                width: 40.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(
                                repositories[index].name!,
                                style: AppTextStyle.headerText,
                              ),
                            ),
                            subtitle: Text(
                              repositories[index].owner!.login!,
                              style: AppTextStyle.subHeaderText,
                            ),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
