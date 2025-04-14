import 'package:cat_tinder/features/cat_swiper/data/models/cat_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part "breed_response_model.g.dart";

@JsonSerializable()
class BreedResponseModel {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "cfa_url")
  String? cfaUrl;

  @JsonKey(name: "vetstreet_url")
  String? vetstreetUrl;

  @JsonKey(name: "vcahospitals_url")
  String? vcahospitalUrl;

  @JsonKey(name: "temperament")
  String? temperament;

  @JsonKey(name: "origin")
  String? origin;

  @JsonKey(name: "country_codes")
  String? countryCodes;

  @JsonKey(name: "country_code")
  String? countryCode;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "life_span")
  String? lifeSpan;

  @JsonKey(name: "indoor")
  int? indoor;

  @JsonKey(name: "alt_names")
  String? altNames;

  @JsonKey(name: "adaptability")
  int? adaptability;

  @JsonKey(name: "affection_level")
  int? affectionLevel;

  @JsonKey(name: "child_friendly")
  int? childFriendly;

  @JsonKey(name: "dog_friendly")
  int? dogFriendly;

  @JsonKey(name: "energy_level")
  int? energyLevel;

  @JsonKey(name: "grooming")
  int? grooming;

  @JsonKey(name: "health_issues")
  int? healthIssues;

  @JsonKey(name: "int?elligence")
  int? intelligence;

  @JsonKey(name: "shedding_level")
  int? sheddingLevel;

  @JsonKey(name: "social_needs")
  int? socialNeeds;

  @JsonKey(name: "stranger_friendly")
  int? strangerFriendly;

  @JsonKey(name: "vocalisation")
  int? vocalisation;

  @JsonKey(name: "experimental")
  int? experimental;

  @JsonKey(name: "hairless")
  int? hairless;

  @JsonKey(name: "natural")
  int? natural;

  @JsonKey(name: "rare")
  int? rare;

  @JsonKey(name: "rex")
  int? rex;

  @JsonKey(name: "suppressed_tail")
  int? suppressedTail;

  @JsonKey(name: "short_legs")
  int? shortLegs;

  @JsonKey(name: "wikipedia_url")
  String? wikipediaUrl;

  @JsonKey(name: "hypoallergenic")
  int? hypoallergenic;

  @JsonKey(name: "reference_image_id")
  String? referenceImageId;

  BreedResponseModel({
    this.description,
    this.origin,
    this.temperament,
    this.lifeSpan,
    this.adaptability,
    this.affectionLevel,
    this.altNames,
    this.cfaUrl,
    this.childFriendly,
    this.countryCode,
    this.countryCodes,
    this.dogFriendly,
    this.energyLevel,
    this.experimental,
    this.grooming,
    this.hairless,
    this.healthIssues,
    this.hypoallergenic,
    this.id,
    this.indoor,
    this.intelligence,
    this.name,
    this.natural,
    this.rare,
    this.referenceImageId,
    this.rex,
    this.sheddingLevel,
    this.shortLegs,
    this.socialNeeds,
    this.strangerFriendly,
    this.suppressedTail,
    this.vcahospitalUrl,
    this.vetstreetUrl,
    this.vocalisation,
    this.wikipediaUrl,
  });

  factory BreedResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BreedResponseModelFromJson(json);
}
