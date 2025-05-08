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
  List<CatEntity> _cats = [];
  List<CatEntity> _allCats = [];
  bool _isLoading = false;

  List<CatEntity> get cats => _cats;
  bool get isLoading => _isLoading;

  List<String> get availableBreeds {
    return _allCats
        .map((cat) => cat.breed ?? "")
        .where((breed) => breed.isNotEmpty)
        .toSet()
        .toList()
      ..sort();
  }

  Future<void> loadCats() async {
    _isLoading = true;
    notifyListeners();

    try {
      _allCats = await getAllLikedCats();
      if (_selectedBreed.isEmpty) {
        _cats = _allCats;
      } else {
        _cats = _allCats.where((cat) => cat.breed == _selectedBreed).toList();
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  String getSelectedBreed() {
    return _selectedBreed;
  }

  Future<void> applyBreedFilter(String breed) async {
    _selectedBreed = breed;
    await loadCats();
  }

  Future<void> addCat(CatEntity cat) async {
    await addLikedCat(cat);
    await loadCats();
  }

  Future<void> removeCat(String uuid) async {
    await removeLikedCat(uuid);
    if (_selectedBreed.isNotEmpty) {
      final cats = await getLikedCatsByBreed(_selectedBreed);
      if (cats.isEmpty) {
        _selectedBreed = "";
      }
    }
    await loadCats();
  }
}
