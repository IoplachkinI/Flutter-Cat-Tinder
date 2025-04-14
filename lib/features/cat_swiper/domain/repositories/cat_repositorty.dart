import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';

abstract class CatRepository {
  CatEntity? getCat(int ind);
  Future<void> initCats();
  void updateCat(int ind);
}