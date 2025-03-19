import "package:flutter/material.dart";
import "package:cat_tinder/src/screens/main_screen.dart";

void main() {
  runApp(const CatApp());
}

class CatApp extends StatelessWidget {
  const CatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CatTinder",
      // theme: ThemeData(primarySwatch: Colors.white),
      home: const MainScreen(),
    );
  }
}
