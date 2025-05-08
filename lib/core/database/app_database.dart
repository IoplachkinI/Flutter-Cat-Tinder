import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:injectable/injectable.dart';

part 'app_database.g.dart';

class LikedCats extends Table {
  TextColumn get uuid => text()();
  TextColumn get name => text().nullable()();
  TextColumn get breed => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get likeDate => text()();
  TextColumn get temperament => text().nullable()();
  TextColumn get origin => text().nullable()();
  TextColumn get lifespan => text().nullable()();

  @override
  Set<Column> get primaryKey => {uuid};
}

@DriftDatabase(tables: [LikedCats])
@LazySingleton()
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
