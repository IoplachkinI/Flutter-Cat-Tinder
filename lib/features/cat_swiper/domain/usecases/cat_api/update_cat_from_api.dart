import 'package:injectable/injectable.dart';

import 'package:cat_tinder/features/cat_swiper/domain/repositories/cat_api_repository.dart';

@injectable
class UpdateCatFromApi {
  final CatApiRepository catRepository;

  UpdateCatFromApi({required this.catRepository});

  Future<void> call(int ind) async {
    try {
      await catRepository.updateCat(ind);
    } catch (e) {
      rethrow;
    }
  }
}
