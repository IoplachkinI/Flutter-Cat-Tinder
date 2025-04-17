import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';

abstract class LikedCatsDatasource {
  void storeCat(CatEntity cat);
  void removeCatByUuid(String uuid);
  List<CatEntity> getAllCats();
  List<CatEntity> getCatsByBreed(String breed);
}
