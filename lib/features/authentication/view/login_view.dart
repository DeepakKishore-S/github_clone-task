import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_clone/features/authentication/model_view/bloc/authentication_bloc.dart';
import 'package:github_clone/utils/app_theme.dart';
import 'package:github_clone/utils/strings.dart';

class LoginView extends StatelessWidget {
  static const routName = "/login view";
  LoginView({super.key});
  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              ImagesPath.githubLogo,
            ),
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              ImagesPath.computer,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Lets built from here...",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Our platform drives innovation with tools that boost developer velocity",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: AppColors.secondayTextColor,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: width * 0.8,
              height: height * 0.05,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Event to sign user via github authetication
                  context.read<AuthenticationBloc>().add(
                        const AuthenticateUserEvent(),
                      );
                },
                child: const Text(
                  "Sign in with Github",
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
