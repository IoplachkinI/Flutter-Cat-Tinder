import 'package:injectable/injectable.dart';

import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_swiper/domain/repositories/cat_api_repository.dart';

@injectable
class UpdateCatFromApi {
  final CatApiRepository catRepository;

  UpdateCatFromApi({required this.catRepository});

  Future<void> call(int ind) async {
    print("UpdateCatFromApi");
    try {
      await catRepository.updateCat(ind);
    } catch (e, s) {
      print("Caught in UpdateCatFromApi");
      print("Stack trace: $s");
      rethrow;
    }
  }
}
