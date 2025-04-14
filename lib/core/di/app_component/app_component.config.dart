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

import '../../../features/cat_swiper/data/datasources/cat_remote_datasource.dart'
    as _i492;
import '../../../features/cat_swiper/data/datasources/cat_remote_datasource_impl.dart'
    as _i903;
import '../../../features/cat_swiper/data/repositories/cat_repository_impl.dart'
    as _i680;
import '../../../features/cat_swiper/domain/repositories/cat_repositorty.dart'
    as _i635;
import '../../../features/cat_swiper/domain/usecases/get_cat_by_ind.dart'
    as _i736;
import '../../../features/cat_swiper/domain/usecases/init_cats.dart' as _i537;
import '../../../features/cat_swiper/domain/usecases/update_cat_by_ind.dart'
    as _i130;
import '../../../features/cat_swiper/presentation/cat_details/cat_details_viewmodel.dart'
    as _i954;
import '../../../features/cat_swiper/presentation/cat_swiper/cat_swiper_viewmodel.dart'
    as _i939;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i492.CatRemoteDatasource>(
      () => _i903.CatRemoteDatasourceImpl(),
    );
    gh.lazySingleton<_i635.CatRepository>(
      () => _i680.CatRepositoryImpl(
        remoteDatasource: gh<_i492.CatRemoteDatasource>(),
      ),
    );
    gh.factory<_i736.GetCatByInd>(
      () => _i736.GetCatByInd(catRepository: gh<_i635.CatRepository>()),
    );
    gh.factory<_i130.UpdateCatByInd>(
      () => _i130.UpdateCatByInd(catRepository: gh<_i635.CatRepository>()),
    );
    gh.factory<_i537.InitCats>(
      () => _i537.InitCats(catRepository: gh<_i635.CatRepository>()),
    );
    gh.factory<_i954.CatDetailsViewModel>(
      () => _i954.CatDetailsViewModel(getCatByInd: gh<_i736.GetCatByInd>()),
    );
    gh.factory<_i939.CatSwiperViewModel>(
      () => _i939.CatSwiperViewModel(
        getCatByInd: gh<_i736.GetCatByInd>(),
        updateCatByInd: gh<_i130.UpdateCatByInd>(),
        initCats: gh<_i537.InitCats>(),
      ),
    );
    return this;
  }
}
