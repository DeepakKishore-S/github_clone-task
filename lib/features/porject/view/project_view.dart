import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:github_clone/components/loading/loading_screen.dart';
import 'package:github_clone/components/snack_bar.dart';
import 'package:github_clone/features/authentication/model_view/bloc/authentication_bloc.dart';
import 'package:github_clone/features/home/model/organization_repository/organization_repository.dart';
import 'package:github_clone/features/home/model_view/bloc/home_bloc.dart';
import 'package:github_clone/features/porject/components/branch_body_widget.dart';
import 'package:github_clone/features/porject/components/branches_chip_widget.dart';
import 'package:github_clone/features/porject/components/project_header_widget.dart';
import 'package:github_clone/features/porject/model_view/bloc/branch_bloc.dart';
import 'package:github_clone/utils/app_theme.dart';
import 'package:intl/intl.dart';

class ProjectView extends HookWidget {
  static const routName = "/project view";
  ProjectView({Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late double height;
  late double width;
  late OrganizationRepository repository;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    useEffect(() {
      if (context.read<HomeBloc>().state is ProjectViewState) {
        repository = context.read<HomeBloc>().organizationRepository[
            (context.read<HomeBloc>().state as ProjectViewState).selectedIndex];
        context.read<BranchBloc>().add(
              InitializeBranchEvent(
                token: context.read<AuthenticationBloc>().accessToken!,
                owner: repository.owner!.login!,
                repo: repository.name!,
              ),
            );
      }
    }, [key]);

    return BlocConsumer<BranchBloc, BranchState>(
      buildWhen: (previous, current) {
        return current.isLoading != previous.isLoading;
      },
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen().show(context: context, text: "Loading...");
        } else {
          LoadingScreen().hide();
        }
        if (state.error != null) {
          AppSnackBars.errorSnackBar(
            context: context,
            content: state.error!.message,
          );
        }
        if (state is HomeViewState) {
          context.read<HomeBloc>().add(
                const BackToHomeViewEvent(),
              );
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            context.read<HomeBloc>().add(
                  const BackToHomeViewEvent(),
                );
            return Future.value(true);
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  context.read<BranchBloc>().add(
                        const GoToHomeViewEvent(),
                      );
                },
              ),
              title: const Text(
                'Project',
                style: AppTextStyle.titleText,
              ),
              centerTitle: true,
              elevation: 0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                children: [
                  // project header view
                  ProjectHeaderWidget(),
                  // projecct branch widget
                  BranchesChipWidget(),
                  // project body widget
                  Expanded(child: BranchBodyWidget())
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
