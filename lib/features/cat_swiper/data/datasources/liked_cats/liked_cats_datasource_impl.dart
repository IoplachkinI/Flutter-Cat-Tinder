import 'package:cat_tinder/core/database/app_database.dart';
import 'package:cat_tinder/features/cat_swiper/data/datasources/liked_cats/liked_cats_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';
import 'package:drift/drift.dart';
import 'package:intl/intl.dart';

@LazySingleton(as: LikedCatsDatasource)
class LikedCatsDatasourceImpl implements LikedCatsDatasource {
  final AppDatabase _database;

  LikedCatsDatasourceImpl(this._database);

  @override
  Future<void> storeCat(CatEntity cat) async {
    await _database
        .into(_database.likedCats)
        .insert(
          LikedCatsCompanion(
            uuid: Value(cat.uuid),
            name: Value(cat.breed),
            breed: Value(cat.breed),
            imageUrl: Value(cat.imageUrl),
            description: Value(cat.description),
            likeDate: Value(
              DateFormat('MMM d, y HH:mm:ss').format(DateTime.now()),
            ),
            temperament: Value(cat.temperament),
            origin: Value(cat.origin),
            lifespan: Value(cat.lifespan),
          ),
        );
  }

  @override
  Future<void> removeCatByUuid(String uuid) async {
    await (_database.delete(_database.likedCats)
      ..where((tbl) => tbl.uuid.equals(uuid))).go();
  }

  @override
  Future<List<CatEntity>> getAllCats() async {
    final cats = await _database.select(_database.likedCats).get();
    return cats
        .map(
          (cat) => CatEntity(
            uuid: cat.uuid,
            likeDate: cat.likeDate,
            breed: cat.breed,
            imageUrl: cat.imageUrl,
            description: cat.description,
            temperament: cat.temperament,
            origin: cat.origin,
            lifespan: cat.lifespan,
          ),
        )
        .toList();
  }

  @override
  Future<List<CatEntity>> getCatsByBreed(String breed) async {
    final cats =
        await (_database.select(_database.likedCats)
          ..where((tbl) => tbl.breed.equals(breed))).get();
    return cats
        .map(
          (cat) => CatEntity(
            uuid: cat.uuid,
            likeDate: cat.likeDate,
            breed: cat.breed,
            imageUrl: cat.imageUrl,
            description: cat.description,
            temperament: cat.temperament,
            origin: cat.origin,
            lifespan: cat.lifespan,
          ),
        )
        .toList();
  }
}
