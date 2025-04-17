import 'dart:collection';

import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_swiper/domain/usecases/cat_api/get_cat_from_api.dart';
import 'package:cat_tinder/features/cat_swiper/domain/usecases/cat_api/update_cat_from_api.dart';
import 'package:cat_tinder/features/cat_swiper/domain/usecases/cat_api/init_cats_from_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainScreenViewModel extends ChangeNotifier {
  MainScreenViewModel({
    required this.getCatByInd,
    required this.updateCatByInd,
    required this.initCats,
  }) {
    _init();
  }

  void _init() async {
    await initCats().then((_) {
      notifyListeners();
    });
  }

  final GetCatFromApi getCatByInd;
  final UpdateCatFromApi updateCatByInd;
  final InitCatsFromApi initCats;

  int _likeCount = 0;
  int _dislikeCount = 0;
  final HashSet<int> _catsToUpdate = HashSet<int>();
  double _lastPercentage = 0.0;
  double _curPercentage = 0.0;

  CatEntity? getCat(int ind) {
    return getCatByInd(ind);
  }

  Future<void> updateDueCats() async {
    try {
      final tmpCats = _catsToUpdate;
      for (final ind in tmpCats) {
        await updateCatByInd(ind)
            .then((_) {
              _catsToUpdate.remove(ind);
            })
            .then((_) => {_catsToUpdate.remove(ind)});
      }
    } catch (e) {
      print("Caught in CatSwiperViewmodel");
      rethrow;
    }
    notifyListeners();
  }

  Future<void> updateCat(int ind) async {
    try {
      _catsToUpdate.add(ind);
      await updateCatByInd(ind).then((_) {
        _catsToUpdate.remove(ind);
      });
    } catch (e) {
      print("Caught in CatSwiperViewmodel");
      rethrow;
    }
    notifyListeners();
  }

  void incrementLikes() {
    _likeCount++;
    _updatePercentage();
  }

  void decrementLikes() {
    _likeCount--;
    _updatePercentage();
  }

  void incrementDislikes() {
    _dislikeCount++;
    _updatePercentage();
  }

  void _updatePercentage() {
    _lastPercentage = _curPercentage;
    _curPercentage = _dislikeCount / (_dislikeCount + _likeCount);
    notifyListeners();
  }

  double get lastPercentage => _lastPercentage;

  double get curPercentage => _curPercentage;

  int get likeCount => _likeCount;

  int get dislikeCount => _dislikeCount;
}
