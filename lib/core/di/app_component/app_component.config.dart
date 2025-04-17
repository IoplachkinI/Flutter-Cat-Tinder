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

import '../../../features/cat_swiper/data/datasources/cat_api/cat_api_datasource.dart'
    as _i12;
import '../../../features/cat_swiper/data/datasources/cat_api/cat_api_datasource_impl.dart'
    as _i379;
import '../../../features/cat_swiper/data/datasources/liked_cats/liked_cats_datasource.dart'
    as _i1040;
import '../../../features/cat_swiper/data/datasources/liked_cats/liked_cats_datasource_impl.dart'
    as _i492;
import '../../../features/cat_swiper/data/repositories/cat_api_repository_impl.dart'
    as _i387;
import '../../../features/cat_swiper/data/repositories/liked_cats_repository_impl.dart'
    as _i229;
import '../../../features/cat_swiper/domain/repositories/cat_api_repository.dart'
    as _i577;
import '../../../features/cat_swiper/domain/repositories/liked_cats_repository.dart'
    as _i344;
import '../../../features/cat_swiper/domain/usecases/cat_api/get_cat_from_api.dart'
    as _i557;
import '../../../features/cat_swiper/domain/usecases/cat_api/init_cats_from_api.dart'
    as _i657;
import '../../../features/cat_swiper/domain/usecases/cat_api/update_cat_from_api.dart'
    as _i318;
import '../../../features/cat_swiper/domain/usecases/liked_cats/add_liked_cat.dart'
    as _i755;
import '../../../features/cat_swiper/domain/usecases/liked_cats/get_all_liked_cats.dart'
    as _i713;
import '../../../features/cat_swiper/domain/usecases/liked_cats/get_liked_cats_by_breed.dart'
    as _i363;
import '../../../features/cat_swiper/domain/usecases/liked_cats/remove_liked_cat.dart'
    as _i1021;
import '../../../features/cat_swiper/presentation/liked_cats/liked_cats_viewmodel.dart'
    as _i705;
import '../../../features/cat_swiper/presentation/main_screen/main_screen_viewmodel.dart'
    as _i151;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i1040.LikedCatsDatasource>(
      () => _i492.LikedCatsDatasourceImpl(),
    );
    gh.factory<_i12.CatApiDatasource>(() => _i379.CatApiDatasourceImpl());
    gh.lazySingleton<_i344.LikedCatsRepository>(
      () => _i229.LikedCatsRepositoryImpl(
        likedCatsDatasource: gh<_i1040.LikedCatsDatasource>(),
      ),
    );
    gh.lazySingleton<_i577.CatApiRepository>(
      () => _i387.CatRepositoryImpl(
        remoteDatasource: gh<_i12.CatApiDatasource>(),
      ),
    );
    gh.factory<_i557.GetCatFromApi>(
      () => _i557.GetCatFromApi(catRepository: gh<_i577.CatApiRepository>()),
    );
    gh.factory<_i657.InitCatsFromApi>(
      () => _i657.InitCatsFromApi(catRepository: gh<_i577.CatApiRepository>()),
    );
    gh.factory<_i318.UpdateCatFromApi>(
      () => _i318.UpdateCatFromApi(catRepository: gh<_i577.CatApiRepository>()),
    );
    gh.factory<_i151.MainScreenViewModel>(
      () => _i151.MainScreenViewModel(
        getCatByInd: gh<_i557.GetCatFromApi>(),
        updateCatByInd: gh<_i318.UpdateCatFromApi>(),
        initCats: gh<_i657.InitCatsFromApi>(),
      ),
    );
    gh.factory<_i755.AddLikedCat>(
      () => _i755.AddLikedCat(repository: gh<_i344.LikedCatsRepository>()),
    );
    gh.factory<_i713.GetAllLikedCats>(
      () => _i713.GetAllLikedCats(repository: gh<_i344.LikedCatsRepository>()),
    );
    gh.factory<_i363.GetLikedCatsByBreed>(
      () => _i363.GetLikedCatsByBreed(
        repository: gh<_i344.LikedCatsRepository>(),
      ),
    );
    gh.factory<_i1021.RemoveLikedCat>(
      () => _i1021.RemoveLikedCat(repository: gh<_i344.LikedCatsRepository>()),
    );
    gh.factory<_i705.LikedCatsViewModel>(
      () => _i705.LikedCatsViewModel(
        addLikedCat: gh<_i755.AddLikedCat>(),
        getAllLikedCats: gh<_i713.GetAllLikedCats>(),
        getLikedCatsByBreed: gh<_i363.GetLikedCatsByBreed>(),
        removeLikedCat: gh<_i1021.RemoveLikedCat>(),
      ),
    );
    return this;
  }
}
