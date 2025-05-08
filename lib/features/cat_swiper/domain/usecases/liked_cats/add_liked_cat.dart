import 'package:injectable/injectable.dart';

import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';

import 'package:cat_tinder/features/cat_swiper/domain/repositories/liked_cats_repository.dart';

@injectable
class AddLikedCat {
  final LikedCatsRepository repository;

  AddLikedCat({required this.repository});

  Future<void> call(CatEntity cat) async {
    return await repository.addCat(cat);
  }
}
