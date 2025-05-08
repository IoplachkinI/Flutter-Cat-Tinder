import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_swiper/domain/repositories/liked_cats_repository.dart';
import 'package:injectable/injectable.dart';

import 'package:cat_tinder/features/cat_swiper/data/datasources/liked_cats/liked_cats_datasource.dart';

@LazySingleton(as: LikedCatsRepository)
class LikedCatsRepositoryImpl implements LikedCatsRepository {
  final LikedCatsDatasource likedCatsDatasource;

  LikedCatsRepositoryImpl({required this.likedCatsDatasource});

  @override
  Future<void> addCat(CatEntity cat) async {
    await likedCatsDatasource.storeCat(cat);
  }

  @override
  Future<void> removeCatByUuid(String uuid) async {
    await likedCatsDatasource.removeCatByUuid(uuid);
  }

  @override
  Future<List<CatEntity>> getAllCats() async {
    return await likedCatsDatasource.getAllCats();
  }

  @override
  Future<List<CatEntity>> getCatsByBreed(String breed) async {
    return await likedCatsDatasource.getCatsByBreed(breed);
  }
}
