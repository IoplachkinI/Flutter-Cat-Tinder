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

  @override
  Future<void> updateCat(int ind) async {
    if (ind >= cachedCats.length) {
      return;
    }
    cachedCats[ind] = null;
    try {
      cachedCats[ind] = await remoteDatasource.getCat();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> initCats() async {
    for (int i = 0; i < preloadCatsAmount; i++) {
      while (true) {
        try {
          cachedCats.add(await remoteDatasource.getCat());
          break;
        } catch (_) {}
      }
    }
  }

  @override
  CatEntity? getCat(int ind) {
    if (cachedCats.isEmpty || ind >= cachedCats.length) {
      return null;
    }
    final cat = cachedCats[ind];
    if (cat == null) {
      return null;
    }
    return cat.mapToEntity();
  }
}
