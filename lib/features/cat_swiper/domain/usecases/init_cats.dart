import 'package:injectable/injectable.dart';

import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_swiper/domain/repositories/cat_repositorty.dart';

@injectable
class InitCats {
  final CatRepository catRepository;

  InitCats({required this.catRepository});

  Future<void> call() async {
    await catRepository.initCats();
  }
}