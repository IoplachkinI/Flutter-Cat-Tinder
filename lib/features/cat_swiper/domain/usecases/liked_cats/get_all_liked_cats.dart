import 'package:injectable/injectable.dart';

import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';

import 'package:cat_tinder/features/cat_swiper/domain/repositories/liked_cats_repository.dart';

@injectable
class GetAllLikedCats {
  final LikedCatsRepository repository;

  GetAllLikedCats({required this.repository});

  Future<List<CatEntity>> call() async {
    return await repository.getAllCats();
  }
}
