import 'package:cat_tinder/features/cat_swiper/data/repositories/liked_cats_repository_impl.dart';
import 'package:injectable/injectable.dart';

import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';

import 'package:cat_tinder/features/cat_swiper/domain/repositories/liked_cats_repository.dart';

@injectable
class GetLikedCatsByBreed {
  final LikedCatsRepository repository;

  GetLikedCatsByBreed({required this.repository});

  List<CatEntity> call(String breed) {
    return repository.getCatsByBreed(breed);
  }
}
