import 'dart:async';
import 'dart:convert';

import 'package:cat_tinder/features/cat_swiper/data/datasources/cat_api/cat_api_datasource.dart';
import 'package:cat_tinder/features/cat_swiper/data/models/cat_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:cat_tinder/core/utils/constants/app_constants.dart';

@Injectable(as: CatApiDatasource)
class CatApiDatasourceImpl implements CatApiDatasource {
  @override
  Future<CatResponseModel> getCat() async {
    http.Response response;
    try {
      response = await http
          .get(Uri.parse(apiUrl))
          .timeout(
            const Duration(seconds: 5),
            onTimeout: () {
              throw TimeoutException("The cat api is not responding");
            },
          );
      switch (response.statusCode) {
        case 200:
          return CatResponseModel.fromJson(
            jsonDecode(response.body)[0] as Map<String, dynamic>,
          );
        default:
          throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }
}
