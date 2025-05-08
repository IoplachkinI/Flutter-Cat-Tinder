import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

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
    final breed = breeds?.isNotEmpty == true ? breeds![0] : null;
    return CatEntity(
      uuid: const Uuid().v4(),
      likeDate: DateFormat('MMM d, y HH:mm:ss').format(DateTime.now()),
      imageUrl: imageUrl,
      breed: breed?.name,
      temperament: breed?.temperament,
      origin: breed?.origin,
      lifespan: breed?.lifeSpan,
      description: breed?.description,
    );
  }

  factory CatResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CatResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatResponseModelToJson(this);
}
