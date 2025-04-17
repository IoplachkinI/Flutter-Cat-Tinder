import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';

abstract class CatApiRepository {
  CatEntity? getCat(int ind);
  Future<void> initCats();
  Future<void> updateCat(int ind);
}
