class CatEntity {
  String? imageUrl;
  String? breed;
  String? temperament;
  String? origin;
  String? lifespan;
  String? description;
  final String uuid;
  final String likeDate;

  CatEntity({
    this.imageUrl,
    this.breed,
    this.temperament,
    this.origin,
    this.lifespan,
    this.description,
    required this.uuid,
    required this.likeDate,
  });
}
