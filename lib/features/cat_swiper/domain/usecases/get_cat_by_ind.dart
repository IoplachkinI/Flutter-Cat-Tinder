import 'package:injectable/injectable.dart';

import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_swiper/domain/repositories/cat_repositorty.dart';

@injectable
class GetCatByInd {
  final CatRepository catRepository;

  GetCatByInd({required this.catRepository});

  CatEntity? call(int ind) {
    return catRepository.getCat(ind);
  }
}