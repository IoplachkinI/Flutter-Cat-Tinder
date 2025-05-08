import 'package:injectable/injectable.dart';

import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';

import 'package:cat_tinder/features/cat_swiper/domain/repositories/liked_cats_repository.dart';

@injectable
class GetLikedCatsByBreed {
  final LikedCatsRepository repository;

  GetLikedCatsByBreed({required this.repository});

  Future<List<CatEntity>> call(String breed) async {
    return await repository.getCatsByBreed(breed);
  }
}
