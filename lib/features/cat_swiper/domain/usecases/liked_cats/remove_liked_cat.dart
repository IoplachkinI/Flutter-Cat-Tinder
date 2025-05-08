import 'package:injectable/injectable.dart';

import 'package:cat_tinder/features/cat_swiper/domain/repositories/liked_cats_repository.dart';

@injectable
class RemoveLikedCat {
  final LikedCatsRepository repository;

  RemoveLikedCat({required this.repository});

  Future<void> call(String uuid) async {
    return await repository.removeCatByUuid(uuid);
  }
}
