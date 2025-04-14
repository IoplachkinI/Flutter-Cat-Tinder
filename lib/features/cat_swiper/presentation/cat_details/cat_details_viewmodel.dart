import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_swiper/domain/usecases/get_cat_by_ind.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class CatDetailsViewModel extends ChangeNotifier {
  CatDetailsViewModel({required this.getCatByInd});

  final GetCatByInd getCatByInd;

  Future<CatEntity?> getCat(int ind) async {
    return getCatByInd(ind);
  }
}
