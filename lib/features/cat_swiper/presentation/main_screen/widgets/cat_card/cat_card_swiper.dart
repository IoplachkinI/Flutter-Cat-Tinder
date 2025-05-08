import 'package:cat_tinder/features/cat_swiper/presentation/main_screen/main_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';

import 'package:cat_tinder/core/utils/constants/app_constants.dart';
import 'package:cat_tinder/core/utils/values/colors.dart';
import 'package:cat_tinder/features/cat_swiper/presentation/cat_details/view/cat_details.dart';
import 'cat_card.dart';

class CatCardSwiper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CatCardSwiperState();

  const CatCardSwiper({
    super.key,
    required this.onSwipe,
    required this.cardSwiperController,
  });

  final bool Function(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
    dynamic context,
  )
  onSwipe;

  final CardSwiperController cardSwiperController;
}

class CatCardSwiperState extends State<CatCardSwiper> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MainScreenViewModel>(context, listen: true);

    if (!viewModel.isOnline) {
      bool allCatsSwiped = true;
      for (int i = 0; i < preloadCatsAmount; i++) {
        if (viewModel.getCat(i) != null) {
          allCatsSwiped = false;
          break;
        }
      }

      if (allCatsSwiped) {
        return Center(
          child: Image.asset(
            "assets/images/no_connection_img.png",
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.5,
            fit: BoxFit.contain,
          ),
        );
      }
    }

    if ((viewModel.isLoadingCats || viewModel.isLoading) &&
        viewModel.getCat(_currentIndex) == null) {
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
        ),
      );
    }

    return CardSwiper(
      duration: const Duration(milliseconds: 200),
      initialIndex: 0,
      backCardOffset: const Offset(0, 0),
      cardsCount: preloadCatsAmount,
      controller: widget.cardSwiperController,
      cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
        final cat = viewModel.getCat(index);
        if (cat == null) return null;

        return CatCard(
          cat: cat,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailsScreen(cat: cat)),
            );
          },
        );
      },
      numberOfCardsDisplayed: preloadCatsAmount,
      onSwipe: (previousIndex, currentIndex, direction) {
        setState(() {
          _currentIndex = currentIndex ?? 0;
        });
        return widget.onSwipe(previousIndex, currentIndex, direction, context);
      },
      maxAngle: 30,
      allowedSwipeDirection: const AllowedSwipeDirection.only(
        left: true,
        right: true,
      ),
      isLoop: true,
    );
  }
}
