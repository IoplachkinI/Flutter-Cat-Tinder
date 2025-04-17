// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/cat_swiper/data/datasources/cat_api/cat_api_datasource.dart'
    as _i587;
import '../../features/cat_swiper/data/datasources/cat_api/cat_api_datasource_impl.dart'
    as _i711;
import '../../features/cat_swiper/data/datasources/liked_cats/liked_cats_datasource.dart'
    as _i668;
import '../../features/cat_swiper/data/datasources/liked_cats/liked_cats_datasource_impl.dart'
    as _i385;
import '../../features/cat_swiper/data/repositories/cat_api_repository_impl.dart'
    as _i184;
import '../../features/cat_swiper/data/repositories/liked_cats_repository_impl.dart'
    as _i643;
import '../../features/cat_swiper/domain/repositories/cat_api_repository.dart'
    as _i131;
import '../../features/cat_swiper/domain/repositories/liked_cats_repository.dart'
    as _i933;
import '../../features/cat_swiper/domain/usecases/cat_api/get_cat_from_api.dart'
    as _i808;
import '../../features/cat_swiper/domain/usecases/cat_api/init_cats_from_api.dart'
    as _i602;
import '../../features/cat_swiper/domain/usecases/cat_api/update_cat_from_api.dart'
    as _i566;
import '../../features/cat_swiper/domain/usecases/liked_cats/add_liked_cat.dart'
    as _i729;
import '../../features/cat_swiper/domain/usecases/liked_cats/get_all_liked_cats.dart'
    as _i574;
import '../../features/cat_swiper/domain/usecases/liked_cats/get_liked_cats_by_breed.dart'
    as _i392;
import '../../features/cat_swiper/domain/usecases/liked_cats/remove_liked_cat.dart'
    as _i273;
import '../../features/cat_swiper/presentation/liked_cats/liked_cats_viewmodel.dart'
    as _i641;
import '../../features/cat_swiper/presentation/main_screen/main_screen_viewmodel.dart'
    as _i110;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i668.LikedCatsDatasource>(
      () => _i385.LikedCatsDatasourceImpl(),
    );
    gh.factory<_i587.CatApiDatasource>(() => _i711.CatApiDatasourceImpl());
    gh.lazySingleton<_i933.LikedCatsRepository>(
      () => _i643.LikedCatsRepositoryImpl(
        likedCatsDatasource: gh<_i668.LikedCatsDatasource>(),
      ),
    );
    gh.lazySingleton<_i131.CatApiRepository>(
      () => _i184.CatRepositoryImpl(
        remoteDatasource: gh<_i587.CatApiDatasource>(),
      ),
    );
    gh.factory<_i808.GetCatFromApi>(
      () => _i808.GetCatFromApi(catRepository: gh<_i131.CatApiRepository>()),
    );
    gh.factory<_i602.InitCatsFromApi>(
      () => _i602.InitCatsFromApi(catRepository: gh<_i131.CatApiRepository>()),
    );
    gh.factory<_i566.UpdateCatFromApi>(
      () => _i566.UpdateCatFromApi(catRepository: gh<_i131.CatApiRepository>()),
    );
    gh.factory<_i110.MainScreenViewModel>(
      () => _i110.MainScreenViewModel(
        getCatByInd: gh<_i808.GetCatFromApi>(),
        updateCatByInd: gh<_i566.UpdateCatFromApi>(),
        initCats: gh<_i602.InitCatsFromApi>(),
      ),
    );
    gh.factory<_i729.AddLikedCat>(
      () => _i729.AddLikedCat(repository: gh<_i933.LikedCatsRepository>()),
    );
    gh.factory<_i574.GetAllLikedCats>(
      () => _i574.GetAllLikedCats(repository: gh<_i933.LikedCatsRepository>()),
    );
    gh.factory<_i392.GetLikedCatsByBreed>(
      () => _i392.GetLikedCatsByBreed(
        repository: gh<_i933.LikedCatsRepository>(),
      ),
    );
    gh.factory<_i273.RemoveLikedCat>(
      () => _i273.RemoveLikedCat(repository: gh<_i933.LikedCatsRepository>()),
    );
    gh.factory<_i641.LikedCatsViewModel>(
      () => _i641.LikedCatsViewModel(
        addLikedCat: gh<_i729.AddLikedCat>(),
        getAllLikedCats: gh<_i574.GetAllLikedCats>(),
        getLikedCatsByBreed: gh<_i392.GetLikedCatsByBreed>(),
        removeLikedCat: gh<_i273.RemoveLikedCat>(),
      ),
    );
    return this;
  }
}
