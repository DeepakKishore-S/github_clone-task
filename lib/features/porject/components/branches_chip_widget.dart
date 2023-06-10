import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_clone/features/authentication/model_view/bloc/authentication_bloc.dart';
import 'package:github_clone/features/home/model/organization_repository/organization_repository.dart';
import 'package:github_clone/features/home/model_view/bloc/home_bloc.dart';
import 'package:github_clone/features/porject/model/branch_data/branch_data.dart';
import 'package:github_clone/features/porject/model_view/bloc/branch_bloc.dart';
import 'package:github_clone/utils/app_theme.dart';

class BranchesChipWidget extends StatelessWidget {
  BranchesChipWidget({super.key});
  List<BranchData> branches = [];
  late OrganizationRepository repository;
  @override
  Widget build(BuildContext context) {
    branches = context.read<BranchBloc>().branches.reversed.toList();
    repository = context
        .read<HomeBloc>()
        .organizationRepository[context.read<HomeBloc>().selectedProjectIndex!];
    return Container(
      height: 60,
      padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: branches.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.read<BranchBloc>().add(
                    SelectBranchEvent(
                        owner: repository.owner!.login!,
                        repo: repository.name!,
                        sha: branches[index].commit!.sha ?? "",
                        selectedIndex: index,
                        token: context.read<AuthenticationBloc>().accessToken!,
                        uri: branches[index].commit!.url!),
                  );
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 116,
                height: 40,
                decoration: BoxDecoration(
                  color: context.read<BranchBloc>().selectedBranchIndex == index
                      ? AppColors.primaryTextColor
                      : AppColors.secondaryColor[100],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Text(
                    branches[index].name!,
                    textAlign: TextAlign.center,
                    style:
                        context.read<BranchBloc>().selectedBranchIndex == index
                            ? AppTextStyle.whiteSubHeaderText
                            : AppTextStyle.subHeaderText,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
