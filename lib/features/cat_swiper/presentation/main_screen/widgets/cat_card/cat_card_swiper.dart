import 'package:cat_tinder/features/cat_swiper/presentation/main_screen/main_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';

import 'package:cat_tinder/core/utils/constants/app_constants.dart';
import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MainScreenViewModel>(context, listen: true);
    return CardSwiper(
      duration: const Duration(milliseconds: 200),
      initialIndex: 0,
      backCardOffset: const Offset(0, 0),
      cardsCount: preloadCatsAmount,
      controller: widget.cardSwiperController,
      cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
        CatEntity? cat;
        cat = viewModel.getCat(index);
        if (cat == null) {
          return null;
        }
        return CatCard(
          cat: cat,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailsScreen(cat: cat!)),
            );
          },
        );
      },
      numberOfCardsDisplayed: preloadCatsAmount,
      onSwipe:
          (previousIndex, currentIndex, direction) =>
              widget.onSwipe(previousIndex, currentIndex, direction, context),
      maxAngle: 30,
      allowedSwipeDirection: const AllowedSwipeDirection.only(
        left: true,
        right: true,
      ),
      isLoop: true,
    );
  }
}
