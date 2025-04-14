import 'package:injectable/injectable.dart';

import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_swiper/domain/repositories/cat_repositorty.dart';

@injectable
class UpdateCatByInd {
  final CatRepository catRepository;

  UpdateCatByInd({required this.catRepository});

  void call(int ind) {
    catRepository.updateCat(ind);
  }
}