import 'package:cat_tinder/features/cat_swiper/data/datasources/cat_api/cat_api_datasource.dart';
import 'package:cat_tinder/features/cat_swiper/data/models/cat_response_model.dart';
import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';
import 'package:cat_tinder/core/utils/constants/app_constants.dart';
import 'package:cat_tinder/features/cat_swiper/domain/repositories/liked_cats_repository.dart';
import 'package:injectable/injectable.dart';

import 'package:cat_tinder/features/cat_swiper/domain/repositories/cat_api_repository.dart';

import 'package:cat_tinder/features/cat_swiper/data/datasources/liked_cats/liked_cats_datasource.dart';

@LazySingleton(as: LikedCatsRepository)
class LikedCatsRepositoryImpl implements LikedCatsRepository {
  final LikedCatsDatasource likedCatsDatasource;

  LikedCatsRepositoryImpl({required this.likedCatsDatasource});

  @override
  void addCat(CatEntity cat) {
    likedCatsDatasource.storeCat(cat);
  }

  @override
  void removeCatByUuid(String uuid) {
    likedCatsDatasource.removeCatByUuid(uuid);
  }

  @override
  List<CatEntity> getAllCats() {
    return likedCatsDatasource.getAllCats();
  }

  @override
  List<CatEntity> getCatsByBreed(String breed) {
    return likedCatsDatasource.getCatsByBreed(breed);
  }
}
