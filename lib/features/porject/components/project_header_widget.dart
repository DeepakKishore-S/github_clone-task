import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_clone/features/home/model/organization_repository/organization_repository.dart';
import 'package:github_clone/features/home/model_view/bloc/home_bloc.dart';
import 'package:github_clone/utils/app_theme.dart';
import 'package:intl/intl.dart';

class ProjectHeaderWidget extends StatelessWidget {
  ProjectHeaderWidget({super.key});
  late double height;
  late double width;
  late OrganizationRepository repository;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    repository = context.read<HomeBloc>().organizationRepository[context.read<HomeBloc>().selectedProjectIndex!];
    return Container(
      width: double.maxFinite,
      height: height * 0.14,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 10),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    repository.owner!.avatarUrl!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(repository.name!, style: AppTextStyle.titleText),
                    Text(repository.owner!.login!,
                        style: AppTextStyle.whiteHeaderText),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
            child: Text(
                'Last update : ${DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse(repository.updatedAt!).toLocal())}',
                textAlign: TextAlign.start,
                style: AppTextStyle.whiteSubHeaderText),
          ),
        ],
      ),
    );
  }
}
