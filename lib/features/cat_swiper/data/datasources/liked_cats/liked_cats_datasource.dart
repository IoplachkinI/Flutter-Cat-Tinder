import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';

abstract class LikedCatsDatasource {
  Future<void> storeCat(CatEntity cat);
  Future<void> removeCatByUuid(String uuid);
  Future<List<CatEntity>> getAllCats();
  Future<List<CatEntity>> getCatsByBreed(String breed);
}
