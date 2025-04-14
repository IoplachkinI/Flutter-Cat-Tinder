import 'dart:convert';

import 'package:cat_tinder/features/cat_swiper/data/datasources/cat_remote_datasource.dart';
import 'package:cat_tinder/features/cat_swiper/data/models/cat_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:cat_tinder/core/utils/constants/app_constants.dart';

@Injectable(as: CatRemoteDatasource)
class CatRemoteDatasourceImpl implements CatRemoteDatasource {
  @override
  Future<CatResponseModel> getCat() async {
    final response = await http.get(Uri.parse(apiUrl));
    return CatResponseModel.fromJson(jsonDecode(response.body)[0] as Map<String, dynamic>);
  }
}