import 'package:cat_tinder/features/cat_swiper/data/models/cat_response_model.dart';

abstract class CatApiDatasource {
  Future<CatResponseModel> getCat();
}
