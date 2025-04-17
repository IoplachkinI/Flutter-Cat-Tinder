import 'package:injectable/injectable.dart';

import 'package:cat_tinder/features/cat_swiper/domain/repositories/cat_api_repository.dart';

@injectable
class InitCatsFromApi {
  final CatApiRepository catRepository;

  InitCatsFromApi({required this.catRepository});

  Future<void> call() async {
    await catRepository.initCats();
  }
}
