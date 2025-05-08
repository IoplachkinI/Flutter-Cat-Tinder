import "package:cat_tinder/features/cat_swiper/presentation/liked_cats/widgets/cat_filter.dart";
import "package:cat_tinder/features/cat_swiper/presentation/liked_cats/widgets/cat_list/cat_list.dart";

import "package:flutter/material.dart";

import "package:provider/provider.dart";

import 'package:cat_tinder/core/utils/values/colors.dart';
import "package:cat_tinder/features/cat_swiper/presentation/liked_cats/liked_cats_viewmodel.dart";

class LikedCatsScreen extends StatefulWidget {
  const LikedCatsScreen({super.key});

  @override
  LikedCatsScreenState createState() => LikedCatsScreenState();
}

class LikedCatsScreenState extends State<LikedCatsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LikedCatsViewModel>().loadCats();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        iconTheme: const IconThemeData(color: AppColors.secondary),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            opacity: 0.2,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Consumer<LikedCatsViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.isLoading) {
                return const CircularProgressIndicator();
              }

              final cats = viewModel.cats;
              final breeds = viewModel.availableBreeds;
              final selected = viewModel.getSelectedBreed();

              return Column(
                children: [
                  CatFilter(
                    viewModel: viewModel,
                    selected: selected,
                    breeds: breeds,
                  ),
                  Expanded(child: CatList(cats: cats, viewModel: viewModel)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
