
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:github_clone/app.dart';
import 'package:github_clone/components/drawer.dart';
import 'package:github_clone/components/loading/loading_screen.dart';
import 'package:github_clone/components/snack_bar.dart';
import 'package:github_clone/features/authentication/model_view/bloc/authentication_bloc.dart';
import 'package:github_clone/features/home/components/home_body_widget.dart';
import 'package:github_clone/features/home/components/home_header_widget.dart';
import 'package:github_clone/features/home/components/name_card_widget.dart';
import 'package:github_clone/features/home/model_view/bloc/home_bloc.dart';
import 'package:github_clone/features/porject/view/project_view.dart';
import 'package:github_clone/utils/app_theme.dart';

class HomeView extends HookWidget {
  static const routName = "/home view";
  HomeView({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      // Loading all the data for home page using [InitializeHomeEvent]
      context.read<HomeBloc>().add(
            InitializeHomeEvent(
              context.read<AuthenticationBloc>().accessToken!,
            ),
          );
    }, [key]);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return BlocConsumer<HomeBloc, HomeState>(
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
        if (state is UnAuthenticatedState) {
          // Navigate  the user to login page after log out event
          Navigator.of(context).pushNamedAndRemoveUntil(
            MyApp.routName,
            (Route<dynamic> route) => false,
          );
        } else if (state is ProjectViewState) {
          // Navigate  the user to projects view
          Navigator.of(context).pushNamed(ProjectView.routName);
        } else if (state is HomeViewsState) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: _key,
          drawer: appDrawer(
            context: context,
            height: height,
          ),
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: Stack(
              children: [
                SizedBox(
                  height: height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Home header widget
                      HomeHeaderWidget(
                        height: height,
                        globalKey: _key,
                      ),
                      // Home body widget
                      HomeBodyWidget(
                        height: height,
                      ),
                    ],
                  ),
                ),
                // Home name card widget
                Positioned(
                  top: height * 0.13,
                  child: NameCardWidget(
                    height: height,
                    width: width,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
