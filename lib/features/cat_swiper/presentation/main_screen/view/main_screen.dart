import "package:cat_tinder/core/utils/values/colors.dart";
import "package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart";
import "package:cat_tinder/features/cat_swiper/presentation/main_screen/main_screen_viewmodel.dart";
import "package:cat_tinder/features/cat_swiper/presentation/liked_cats/liked_cats_viewmodel.dart";
import "package:cat_tinder/features/cat_swiper/presentation/main_screen/widgets/like_dislike_bar.dart";
import "package:flutter/material.dart";
import "package:flutter_card_swiper/flutter_card_swiper.dart";
import "package:intl/intl.dart";

import "package:cat_tinder/features/cat_swiper/presentation/main_screen/widgets/like_dislike_button.dart";
import "package:provider/provider.dart";

import "package:cat_tinder/features/cat_swiper/presentation/liked_cats/view/liked_cats.dart";

import "package:cat_tinder/features/cat_swiper/presentation/main_screen/widgets/error_dialog.dart";

import "../widgets/cat_card/cat_card_swiper.dart";
import "../widgets/like_dislike_count.dart";
import "../widgets/loading_screen.dart";

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  final CardSwiperController cardSwiperController = CardSwiperController();
  bool _initialLoading = true;
  bool _isShowingDialog = false;

  void _updateCat(int? ind) async {
    final catSwiperViewModel = Provider.of<MainScreenViewModel>(
      context,
      listen: false,
    );
    try {
      if (ind == null) {
        await catSwiperViewModel.updateDueCats();
      } else {
        await catSwiperViewModel.updateCat(ind);
      }
    } catch (_) {
      if (!mounted) {
        return;
      }
      _showCatLoadErrorDialog(context);
    }
  }

  bool onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
    context,
  ) {
    final catSwiperViewModel = Provider.of<MainScreenViewModel>(
      context,
      listen: false,
    );
    if (catSwiperViewModel.getCatByInd(previousIndex) == null) {
      return true;
    }
    if (direction == CardSwiperDirection.right) {
      catSwiperViewModel.incrementLikes();
      final likedCat = catSwiperViewModel.getCatByInd(previousIndex);
      likedCat?.likeDate = DateFormat('y MMM d – HH:mm').format(DateTime.now());
      Provider.of<LikedCatsViewModel>(
        context,
        listen: false,
      ).addCat(likedCat ?? CatEntity());
    } else {
      catSwiperViewModel.incrementDislikes();
    }
    _updateCat(previousIndex);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenViewModel>(
      builder: (context, viewModel, child) {
        if (_initialLoading && viewModel.getCat(0) == null) {
          _initialLoading = false;
          return const LoadingScreen();
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            iconTheme: const IconThemeData(color: AppColors.secondary),
            actions: [
              IconButton(
                icon: const Icon(Icons.menu),
                tooltip: "Open liked cats",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LikedCatsScreen(),
                    ),
                  );
                },
              ),
            ],
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
              child: Column(
                children: [
                  Flexible(
                    flex: 20,
                    child: Consumer<MainScreenViewModel>(
                      builder:
                          (context, viewModel, child) => CatCardSwiper(
                            onSwipe: onSwipe,
                            cardSwiperController: cardSwiperController,
                          ),
                    ),
                  ),
                  const Flexible(
                    flex: 1,
                    child: SizedBox(width: double.infinity, height: 20),
                  ),
                  Flexible(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        LikeDislikeButton(
                          onPressed: () {
                            cardSwiperController.swipe(
                              CardSwiperDirection.left,
                            );
                          },
                          imagePath: "assets/images/dislike_icon.png",
                        ),
                        LikeDislikeButton(
                          onPressed: () {
                            cardSwiperController.swipe(
                              CardSwiperDirection.right,
                            );
                          },
                          imagePath: "assets/images/like_icon.png",
                        ),
                      ],
                    ),
                  ),
                  const Flexible(
                    flex: 1,
                    child: SizedBox(width: double.infinity, height: 50),
                  ),
                  Flexible(
                    flex: 1,
                    child: Consumer<MainScreenViewModel>(
                      builder:
                          (context, viewModel, child) => LikeDislikeBar(
                            lastPercentage: viewModel.lastPercentage,
                            curPercentage: viewModel.curPercentage,
                          ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: Consumer<MainScreenViewModel>(
                        builder:
                            (context, viewModel, child) => LikeDislikeCount(
                              likeCount: viewModel.likeCount,
                              dislikeCount: viewModel.dislikeCount,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showCatLoadErrorDialog(BuildContext context) async {
    if (_isShowingDialog) {
      return;
    }
    _isShowingDialog = true;
    showDialog(
      context: context,
      builder: (BuildContext context) => const ErrorDialog(),
    ).then((_) {
      _isShowingDialog = false;
      _updateCat(null);
    });
  }
}
