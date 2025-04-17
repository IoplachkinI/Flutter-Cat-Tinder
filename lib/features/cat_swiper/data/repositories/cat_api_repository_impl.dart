import 'package:cat_tinder/features/cat_swiper/data/datasources/cat_api/cat_api_datasource.dart';
import 'package:cat_tinder/features/cat_swiper/data/models/cat_response_model.dart';
import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';
import 'package:cat_tinder/core/utils/constants/app_constants.dart';
import 'package:injectable/injectable.dart';

import 'package:cat_tinder/features/cat_swiper/domain/repositories/cat_api_repository.dart';

@LazySingleton(as: CatApiRepository)
class CatRepositoryImpl implements CatApiRepository {
  CatRepositoryImpl({required this.remoteDatasource}) : cachedCats = [];

  final CatApiDatasource remoteDatasource;
  List<CatResponseModel?> cachedCats;

  bool _loading = true;

  @override
  Future<void> updateCat(int ind) async {
    print("CAT UPDATE CALLED!");
    cachedCats[ind] = null;
    try {
      cachedCats[ind] = await remoteDatasource.getCat();
      print("Cat updated: ${cachedCats[ind]?.breeds?[0].name}");
    } catch (e, s) {
      print("UPDATE EXCEPTION CAUGHT!");
      print("Stack trace: $s");
      rethrow;
    }
  }

  @override
  Future<void> initCats() async {
    _loading = true;
    for (int i = 0; i < preloadCatsAmount; i++) {
      while (true) {
        try {
          cachedCats.add(await remoteDatasource.getCat());
          break;
        } catch (_) {}
      }
    }
    _loading = false;
  }

  @override
  CatEntity? getCat(int ind) {
    if (cachedCats.isEmpty) {
      return null;
    }
    return cachedCats[ind]?.mapToEntity();
  }
}
