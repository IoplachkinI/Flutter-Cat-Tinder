import "package:cat_tinder/features/cat_swiper/presentation/liked_cats/widgets/cat_filter.dart";
import "package:cat_tinder/features/cat_swiper/presentation/liked_cats/widgets/cat_list/cat_list.dart";

import "package:flutter/material.dart";

import "package:provider/provider.dart";

import "package:cat_tinder/features/cat_swiper/presentation/liked_cats/liked_cats_viewmodel.dart";

class LikedCatsScreen extends StatefulWidget {
  const LikedCatsScreen({super.key});

  @override
  LikedCatsScreenState createState() => LikedCatsScreenState();
}

class LikedCatsScreenState extends State<LikedCatsScreen> {
  final List<String> selectedBreeds = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
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
              final cats = viewModel.getCatsWithFilter();
              final breeds =
                  viewModel
                      .getAllCats()
                      .map((cat) => cat.breed ?? "")
                      .toSet()
                      .toList();
              breeds.sort();
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
