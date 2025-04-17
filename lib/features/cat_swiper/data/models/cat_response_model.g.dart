// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatResponseModel _$CatResponseModelFromJson(Map<String, dynamic> json) =>
    CatResponseModel(
      id: json['id'] as String?,
      imageUrl: json['url'] as String?,
      breeds:
          (json['breeds'] as List<dynamic>?)
              ?.map(
                (e) => BreedResponseModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      imageHeight: (json['height'] as num?)?.toInt(),
      imageWidth: (json['width'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CatResponseModelToJson(CatResponseModel instance) =>
    <String, dynamic>{
      'breeds': instance.breeds,
      'id': instance.id,
      'url': instance.imageUrl,
      'width': instance.imageWidth,
      'height': instance.imageHeight,
    };
