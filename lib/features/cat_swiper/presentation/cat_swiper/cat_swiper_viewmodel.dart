import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_swiper/domain/repositories/cat_repositorty.dart';
import 'package:cat_tinder/features/cat_swiper/domain/usecases/get_cat_by_ind.dart';
import 'package:cat_tinder/features/cat_swiper/domain/usecases/update_cat_by_ind.dart';
import 'package:cat_tinder/features/cat_swiper/domain/usecases/init_cats.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class CatSwiperViewModel extends ChangeNotifier {
  CatSwiperViewModel({required this.getCatByInd, required this.updateCatByInd, required this.initCats}) {
    _init();
  }

  void _init() async {
    await initCats().then((_) {
      print("Notifying!");
      notifyListeners();
    });
  }

  final GetCatByInd getCatByInd;
  final UpdateCatByInd updateCatByInd;
  final InitCats initCats;

  CatEntity? getCat(int ind) {
    CatEntity? result = getCatByInd(ind);
    return result;
  }

  void updateCat(int ind) {
    updateCatByInd(ind);
  }
}
