import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'breed_response_model.dart';

part 'cat_response_model.g.dart';

@JsonSerializable()
class CatResponseModel {
  @JsonKey(name: "breeds")
  List<BreedResponseModel>? breeds;

  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "url")
  String? imageUrl;

  @JsonKey(name: "width")
  int? imageWidth;

  @JsonKey(name: "height")
  int? imageHeight;

  CatResponseModel({
    this.id,
    this.imageUrl,
    this.breeds,
    this.imageHeight,
    this.imageWidth,
  });

  CatEntity mapToEntity() {
    return CatEntity(
      imageUrl: imageUrl,
      breed: breeds?[0].name,
      temperament: breeds?[0].temperament,
      origin: breeds?[0].origin,
      lifespan: breeds?[0].lifeSpan,
      description: breeds?[0].description,
    );
  }

  factory CatResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CatResponseModelFromJson(json);
}
