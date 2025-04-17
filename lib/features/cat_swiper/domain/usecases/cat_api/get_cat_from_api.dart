import 'package:injectable/injectable.dart';

import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_swiper/domain/repositories/cat_api_repository.dart';

@injectable
class GetCatFromApi {
  final CatApiRepository catRepository;

  GetCatFromApi({required this.catRepository});

  CatEntity? call(int ind) {
    CatEntity? result;
    result = catRepository.getCat(ind);
    return result;
  }
}
