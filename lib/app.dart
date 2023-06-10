import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_clone/components/loading/loading_screen.dart';
import 'package:github_clone/features/authentication/model_view/bloc/authentication_bloc.dart';
import 'package:github_clone/features/authentication/view/login_view.dart';
import 'package:github_clone/features/home/model_view/bloc/home_bloc.dart';
import 'package:github_clone/features/home/view/home_view.dart';
import 'package:github_clone/features/porject/model_view/bloc/branch_bloc.dart';
import 'package:github_clone/utils/app_theme.dart';
import 'package:github_clone/components/snack_bar.dart';
import 'package:github_clone/utils/named_routes.dart';


class MyApp extends StatelessWidget {
  static const routName = "/myapp";
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(),
        ),
        BlocProvider<BranchBloc>(
          create: (BuildContext context) => BranchBloc(),
        ),
      ],
      child: MaterialApp(
        theme: appTheme,
        routes: AppRoutes.routes,
        debugShowCheckedModeBanner: false,
        title: 'Github App Clone',
        home: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            // condition to show loading pop up
            if (state.isLoading) {
              LoadingScreen().show(context: context, text: "Loading...");
            } else {
              LoadingScreen().hide();
            }
            // condition to show error
            if (state.error != null) {
              AppSnackBars.errorSnackBar(
                context: context,
                content: state.error!.message,
              );
            } else {
              
              if (state is AuthencticatedState) {
                AppSnackBars.snackBar(
                  context: context,
                  content: state.message,
                );
              }
            }
          },
          buildWhen: (previous, current) {
            return previous.runtimeType != current.runtimeType;
          },
          builder: (context, state) {
            // condition to Authenticate user and Navigate to corresponding page
            if (state is AuthenticationBlocInitial) {
              return LoginView();
            } else if (state is AuthencticatedState) {
              return HomeView();
            } else {
              return const  CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
