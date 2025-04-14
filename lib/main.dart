import "package:cat_tinder/features/cat_swiper/presentation/cat_details/cat_details_viewmodel.dart";
import "package:cat_tinder/core/di/app_component/app_component.dart";
import "package:cat_tinder/features/cat_swiper/presentation/cat_swiper/cat_swiper_viewmodel.dart";
import "package:flutter/material.dart";
import "package:cat_tinder/src/screens/main_screen.dart";
import 'package:provider/provider.dart';

import "core/di/app_component/app_component.dart";
import "package:cat_tinder/features/cat_swiper/presentation/cat_swiper/view/cat_swiper.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initAppComponentLocator();
  runApp(const CatApp());
}

class CatApp extends StatelessWidget {
  const CatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CatSwiperViewModel>(
          create: (BuildContext context) => getIt<CatSwiperViewModel>(),
        ),
        ChangeNotifierProvider<CatDetailsViewModel>(
          create: (BuildContext context) => getIt<CatDetailsViewModel>(),
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
