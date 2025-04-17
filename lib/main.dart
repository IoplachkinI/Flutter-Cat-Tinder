import "package:cat_tinder/core/di/di.dart";
import "package:cat_tinder/features/cat_swiper/presentation/liked_cats/liked_cats_viewmodel.dart";
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import "features/cat_swiper/presentation/main_screen/main_screen_viewmodel.dart";
import "features/cat_swiper/presentation/main_screen/view/main_screen.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initAppComponentGetIt();
  runApp(const CatApp());
}

class CatApp extends StatelessWidget {
  const CatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainScreenViewModel>(
          create: (BuildContext context) => getIt<MainScreenViewModel>(),
        ),
        ChangeNotifierProvider<LikedCatsViewModel>(
          create: (BuildContext context) => getIt<LikedCatsViewModel>(),
        ),
      ],
      child: const MaterialApp(
        title: "CatTinder",
        home: MainScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
