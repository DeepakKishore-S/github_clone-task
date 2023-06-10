import 'package:flutter/material.dart';
import 'package:github_clone/app.dart';
import 'package:github_clone/features/authentication/view/login_view.dart';
import 'package:github_clone/features/home/view/home_view.dart';
import 'package:github_clone/features/porject/view/project_view.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    MyApp.routName: (context) => const MyApp(),
    LoginView.routName: (context) => LoginView(),
    HomeView.routName: (context) => HomeView(),
    ProjectView.routName: (context) => ProjectView(),
  };
}
