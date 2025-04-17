import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_swiper/domain/usecases/liked_cats/add_liked_cat.dart';
import 'package:cat_tinder/features/cat_swiper/domain/usecases/liked_cats/get_all_liked_cats.dart';
import 'package:cat_tinder/features/cat_swiper/domain/usecases/liked_cats/get_liked_cats_by_breed.dart';
import 'package:cat_tinder/features/cat_swiper/domain/usecases/liked_cats/remove_liked_cat.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class LikedCatsViewModel extends ChangeNotifier {
  LikedCatsViewModel({
    required this.addLikedCat,
    required this.getAllLikedCats,
    required this.getLikedCatsByBreed,
    required this.removeLikedCat,
  });

  final AddLikedCat addLikedCat;
  final GetAllLikedCats getAllLikedCats;
  final GetLikedCatsByBreed getLikedCatsByBreed;
  final RemoveLikedCat removeLikedCat;

  String _selectedBreed = "";

  List<CatEntity> getCatsWithFilter() {
    if (_selectedBreed == "") {
      return getAllLikedCats();
    }
    return getLikedCatsByBreed(_selectedBreed);
  }

  List<CatEntity> getAllCats() {
    return getAllLikedCats();
  }

  String getSelectedBreed() {
    return _selectedBreed;
  }

  void applyBreedFilter(String breed) {
    _selectedBreed = breed;
    notifyListeners();
  }

  void addCat(CatEntity cat) {
    addLikedCat(cat);
  }

  void removeCat(String uuid) {
    removeLikedCat(uuid);
    if (getLikedCatsByBreed(_selectedBreed).isEmpty) {
      _selectedBreed = "";
    }
    notifyListeners();
  }
}
