import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              color: Color.fromARGB(255, 30, 30, 30),
              backgroundColor: Colors.redAccent,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Loading cats...",
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 30, 30, 30),
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
