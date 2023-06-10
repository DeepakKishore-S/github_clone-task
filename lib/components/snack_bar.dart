import 'package:flutter/material.dart';
import 'package:github_clone/utils/app_theme.dart';

class AppSnackBars {
  static snackBar({
    required BuildContext context,
    required String content,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          content,
          textAlign: TextAlign.center,
        ),
        backgroundColor: AppColors.primaryColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static errorSnackBar({
    required BuildContext context,
    required String content,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.errorColor,
      behavior: SnackBarBehavior.floating,
      content: Text(
        content,
        textAlign: TextAlign.center,
      ),
    ));
  }
}
