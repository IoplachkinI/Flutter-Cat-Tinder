import "package:cat_tinder/core/utils/values/colors.dart";
import "package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart";
import "package:cat_tinder/features/cat_swiper/presentation/main_screen/main_screen_viewmodel.dart";
import "package:cat_tinder/features/cat_swiper/presentation/liked_cats/liked_cats_viewmodel.dart";
import "package:cat_tinder/features/cat_swiper/presentation/main_screen/widgets/like_dislike_bar.dart";
import "package:flutter/material.dart";
import "package:flutter_card_swiper/flutter_card_swiper.dart";
import "package:intl/intl.dart";
import "package:uuid/uuid.dart";

import "package:cat_tinder/features/cat_swiper/presentation/main_screen/widgets/like_dislike_button.dart";
import "package:provider/provider.dart";

import "package:cat_tinder/features/cat_swiper/presentation/liked_cats/view/liked_cats.dart";

import "../widgets/cat_card/cat_card_swiper.dart";
import "../widgets/like_dislike_count.dart";
import "../widgets/loading_screen.dart";
import "../widgets/connectivity_snackbar.dart";
import "../widgets/error_dialog.dart";

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  late AnimationController _animationController;

  final CardSwiperController cardSwiperController = CardSwiperController();
  bool _initialLoading = true;
  bool _isShowingDialog = false;
  bool _wasOnline = true;
  bool _showSnackBar = false;

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
    }
  }

  Future<void> _handleRetry(int failedIndex) async {
    if (_isShowingDialog) return;

    setState(() {
      _isShowingDialog = true;
    });

    final catSwiperViewModel = Provider.of<MainScreenViewModel>(
      context,
      listen: false,
    );

    final shouldRetry = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => const ErrorDialog(),
    );

    if (mounted) {
      setState(() {
        _isShowingDialog = false;
      });

      if (shouldRetry == true) {
        catSwiperViewModel.clearLastFailedIndex();
        _updateCat(null);
      }
    }
  }

  void _showConnectivitySnackbar(bool isOnline) {
    if (!mounted) return;

    setState(() {
      _showSnackBar = true;
    });

    _animationController.forward().then((_) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          _animationController.reverse().then((_) {
            if (mounted) {
              setState(() {
                _showSnackBar = false;
              });
            }
          });
        }
      });
    });
  }

  void _handleOnlineStatusChange(bool isOnline) {
    if (_wasOnline != isOnline) {
      _wasOnline = isOnline;
      _showConnectivitySnackbar(isOnline);
      if (isOnline) {
        _updateCat(null);
      }
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
      return false;
    }

    if (direction == CardSwiperDirection.right) {
      catSwiperViewModel.incrementLikes();
      final likedCat = catSwiperViewModel.getCatByInd(previousIndex);
      if (likedCat != null) {
        Provider.of<LikedCatsViewModel>(context, listen: false).addCat(
          CatEntity(
            uuid: const Uuid().v4(),
            likeDate: DateFormat('MMM d, y HH:mm:ss').format(DateTime.now()),
            imageUrl: likedCat.imageUrl,
            breed: likedCat.breed,
            temperament: likedCat.temperament,
            origin: likedCat.origin,
            lifespan: likedCat.lifespan,
            description: likedCat.description,
          ),
        );
      }
    } else {
      catSwiperViewModel.incrementDislikes();
    }
    _updateCat(previousIndex);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer<MainScreenViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading && viewModel.isOnline && _initialLoading) {
              return const LoadingScreen();
            }

            WidgetsBinding.instance.addPostFrameCallback((_) {
              _handleOnlineStatusChange(viewModel.isOnline);

              if (!viewModel.isOnline) {
                setState(() {
                  _initialLoading = false;
                });
              }

              if (viewModel.lastFailedIndex != null &&
                  !_isShowingDialog &&
                  viewModel.isOnline) {
                _handleRetry(viewModel.lastFailedIndex!);
              }
            });

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
        ),
        if (_showSnackBar)
          ConnectivitySnackBar(
            isOnline: _wasOnline,
            onDismissed: () {
              if (mounted) {
                setState(() {
                  _showSnackBar = false;
                });
              }
            },
          ),
      ],
    );
  }
}
