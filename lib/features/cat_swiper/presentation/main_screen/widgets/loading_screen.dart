import 'package:flutter/material.dart';
import "package:cat_tinder/core/utils/values/colors.dart";

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset("assets/images/app_icon.png", width: 120, height: 120),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: LinearProgressIndicator(
              minHeight: 6,
              color: AppColors.primary,
              backgroundColor: AppColors.accent,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Loading cats...",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
