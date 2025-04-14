

import 'package:cat_tinder/features/cat_swiper/data/models/cat_response_model.dart';

abstract class CatRemoteDatasource {
  Future<CatResponseModel> getCat();
}