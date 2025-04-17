import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class CatEntity {
  String? imageUrl;
  String? breed;
  String? temperament;
  String? origin;
  String? lifespan;
  String? description;
  String uuid;
  String likeDate;

  CatEntity({
    this.imageUrl,
    this.breed,
    this.temperament,
    this.origin,
    this.lifespan,
    this.description,
  }) : uuid = const Uuid().v4(),
       likeDate = DateFormat.yMMMd().format(DateTime.utc(1980));
}
