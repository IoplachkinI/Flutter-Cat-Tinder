import 'package:cat_tinder/features/cat_swiper/data/datasources/liked_cats/liked_cats_datasource.dart';
import 'package:injectable/injectable.dart';

import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';

@LazySingleton(as: LikedCatsDatasource)
class LikedCatsDatasourceImpl implements LikedCatsDatasource {
  final List<CatEntity> _cats = [];

  @override
  void storeCat(CatEntity cat) {
    _cats.add(cat);
  }

  @override
  void removeCatByUuid(String uuid) {
    for (int i = 0; i < _cats.length; i++) {
      if (_cats[i].uuid == uuid) {
        _cats.removeAt(i);
        break;
      }
    }
  }

  @override
  List<CatEntity> getAllCats() {
    return _cats;
  }

  @override
  List<CatEntity> getCatsByBreed(String breed) {
    return List<CatEntity>.from(_cats.where((cat) => cat.breed == breed));
  }
}
