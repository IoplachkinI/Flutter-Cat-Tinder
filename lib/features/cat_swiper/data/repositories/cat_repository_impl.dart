import 'package:cat_tinder/features/cat_swiper/data/datasources/cat_remote_datasource.dart';
import 'package:cat_tinder/features/cat_swiper/data/models/cat_response_model.dart';
import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';
import 'package:cat_tinder/core/utils/constants/app_constants.dart';
import 'package:injectable/injectable.dart';

import 'package:cat_tinder/features/cat_swiper/domain/repositories/cat_repositorty.dart';

@LazySingleton(as: CatRepository)
class CatRepositoryImpl implements CatRepository {
  // static final CatRepositoryImpl _instance = CatRepositoryImpl._internal();
  //
  // CatRepositoryImpl._internal();
  //
  // factory CatRepositoryImpl()  {
  //   _instance.cachedCats = [];
  //   _instance.remoteDatasource = CatRemoteDatasource();
  //   return _instance;
  // }

  CatRepositoryImpl({required this.remoteDatasource}) : cachedCats = [];

  final CatRemoteDatasource remoteDatasource;
  List<CatResponseModel> cachedCats;

  @override
  void updateCat(int ind) async {
    print("$cachedCats, $this");
    cachedCats[ind] = await remoteDatasource.getCat();
  }

  @override
  Future<void> initCats() async {
    for (int i = 0; i < preloadCatsAmount; i++) {
      cachedCats.add(await remoteDatasource.getCat());
    }
    print("Cats INITIALIZED! ${identityHashCode(this)}");
  }

  @override
  CatEntity? getCat(int ind) {
    print("$cachedCats, ${identityHashCode(this)}");
    // print("${cachedCats.isNotEmpty ? cachedCats[ind].mapToEntity() : null}");
    return cachedCats.isNotEmpty ? cachedCats[ind].mapToEntity() : null;
  }
}
