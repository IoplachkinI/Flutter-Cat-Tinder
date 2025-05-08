// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $LikedCatsTable extends LikedCats
    with TableInfo<$LikedCatsTable, LikedCat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LikedCatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _breedMeta = const VerificationMeta('breed');
  @override
  late final GeneratedColumn<String> breed = GeneratedColumn<String>(
    'breed',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _likeDateMeta = const VerificationMeta(
    'likeDate',
  );
  @override
  late final GeneratedColumn<String> likeDate = GeneratedColumn<String>(
    'like_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _temperamentMeta = const VerificationMeta(
    'temperament',
  );
  @override
  late final GeneratedColumn<String> temperament = GeneratedColumn<String>(
    'temperament',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _originMeta = const VerificationMeta('origin');
  @override
  late final GeneratedColumn<String> origin = GeneratedColumn<String>(
    'origin',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lifespanMeta = const VerificationMeta(
    'lifespan',
  );
  @override
  late final GeneratedColumn<String> lifespan = GeneratedColumn<String>(
    'lifespan',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    name,
    breed,
    imageUrl,
    description,
    likeDate,
    temperament,
    origin,
    lifespan,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'liked_cats';
  @override
  VerificationContext validateIntegrity(
    Insertable<LikedCat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('breed')) {
      context.handle(
        _breedMeta,
        breed.isAcceptableOrUnknown(data['breed']!, _breedMeta),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('like_date')) {
      context.handle(
        _likeDateMeta,
        likeDate.isAcceptableOrUnknown(data['like_date']!, _likeDateMeta),
      );
    } else if (isInserting) {
      context.missing(_likeDateMeta);
    }
    if (data.containsKey('temperament')) {
      context.handle(
        _temperamentMeta,
        temperament.isAcceptableOrUnknown(
          data['temperament']!,
          _temperamentMeta,
        ),
      );
    }
    if (data.containsKey('origin')) {
      context.handle(
        _originMeta,
        origin.isAcceptableOrUnknown(data['origin']!, _originMeta),
      );
    }
    if (data.containsKey('lifespan')) {
      context.handle(
        _lifespanMeta,
        lifespan.isAcceptableOrUnknown(data['lifespan']!, _lifespanMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  LikedCat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LikedCat(
      uuid:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}uuid'],
          )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      breed: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}breed'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      likeDate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}like_date'],
          )!,
      temperament: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}temperament'],
      ),
      origin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}origin'],
      ),
      lifespan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lifespan'],
      ),
    );
  }

  @override
  $LikedCatsTable createAlias(String alias) {
    return $LikedCatsTable(attachedDatabase, alias);
  }
}

class LikedCat extends DataClass implements Insertable<LikedCat> {
  final String uuid;
  final String? name;
  final String? breed;
  final String? imageUrl;
  final String? description;
  final String likeDate;
  final String? temperament;
  final String? origin;
  final String? lifespan;
  const LikedCat({
    required this.uuid,
    this.name,
    this.breed,
    this.imageUrl,
    this.description,
    required this.likeDate,
    this.temperament,
    this.origin,
    this.lifespan,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || breed != null) {
      map['breed'] = Variable<String>(breed);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['like_date'] = Variable<String>(likeDate);
    if (!nullToAbsent || temperament != null) {
      map['temperament'] = Variable<String>(temperament);
    }
    if (!nullToAbsent || origin != null) {
      map['origin'] = Variable<String>(origin);
    }
    if (!nullToAbsent || lifespan != null) {
      map['lifespan'] = Variable<String>(lifespan);
    }
    return map;
  }

  LikedCatsCompanion toCompanion(bool nullToAbsent) {
    return LikedCatsCompanion(
      uuid: Value(uuid),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      breed:
          breed == null && nullToAbsent ? const Value.absent() : Value(breed),
      imageUrl:
          imageUrl == null && nullToAbsent
              ? const Value.absent()
              : Value(imageUrl),
      description:
          description == null && nullToAbsent
              ? const Value.absent()
              : Value(description),
      likeDate: Value(likeDate),
      temperament:
          temperament == null && nullToAbsent
              ? const Value.absent()
              : Value(temperament),
      origin:
          origin == null && nullToAbsent ? const Value.absent() : Value(origin),
      lifespan:
          lifespan == null && nullToAbsent
              ? const Value.absent()
              : Value(lifespan),
    );
  }

  factory LikedCat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LikedCat(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String?>(json['name']),
      breed: serializer.fromJson<String?>(json['breed']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      description: serializer.fromJson<String?>(json['description']),
      likeDate: serializer.fromJson<String>(json['likeDate']),
      temperament: serializer.fromJson<String?>(json['temperament']),
      origin: serializer.fromJson<String?>(json['origin']),
      lifespan: serializer.fromJson<String?>(json['lifespan']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String?>(name),
      'breed': serializer.toJson<String?>(breed),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'description': serializer.toJson<String?>(description),
      'likeDate': serializer.toJson<String>(likeDate),
      'temperament': serializer.toJson<String?>(temperament),
      'origin': serializer.toJson<String?>(origin),
      'lifespan': serializer.toJson<String?>(lifespan),
    };
  }

  LikedCat copyWith({
    String? uuid,
    Value<String?> name = const Value.absent(),
    Value<String?> breed = const Value.absent(),
    Value<String?> imageUrl = const Value.absent(),
    Value<String?> description = const Value.absent(),
    String? likeDate,
    Value<String?> temperament = const Value.absent(),
    Value<String?> origin = const Value.absent(),
    Value<String?> lifespan = const Value.absent(),
  }) => LikedCat(
    uuid: uuid ?? this.uuid,
    name: name.present ? name.value : this.name,
    breed: breed.present ? breed.value : this.breed,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    description: description.present ? description.value : this.description,
    likeDate: likeDate ?? this.likeDate,
    temperament: temperament.present ? temperament.value : this.temperament,
    origin: origin.present ? origin.value : this.origin,
    lifespan: lifespan.present ? lifespan.value : this.lifespan,
  );
  LikedCat copyWithCompanion(LikedCatsCompanion data) {
    return LikedCat(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      name: data.name.present ? data.name.value : this.name,
      breed: data.breed.present ? data.breed.value : this.breed,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      description:
          data.description.present ? data.description.value : this.description,
      likeDate: data.likeDate.present ? data.likeDate.value : this.likeDate,
      temperament:
          data.temperament.present ? data.temperament.value : this.temperament,
      origin: data.origin.present ? data.origin.value : this.origin,
      lifespan: data.lifespan.present ? data.lifespan.value : this.lifespan,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LikedCat(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('breed: $breed, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('description: $description, ')
          ..write('likeDate: $likeDate, ')
          ..write('temperament: $temperament, ')
          ..write('origin: $origin, ')
          ..write('lifespan: $lifespan')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uuid,
    name,
    breed,
    imageUrl,
    description,
    likeDate,
    temperament,
    origin,
    lifespan,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LikedCat &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.breed == this.breed &&
          other.imageUrl == this.imageUrl &&
          other.description == this.description &&
          other.likeDate == this.likeDate &&
          other.temperament == this.temperament &&
          other.origin == this.origin &&
          other.lifespan == this.lifespan);
}

class LikedCatsCompanion extends UpdateCompanion<LikedCat> {
  final Value<String> uuid;
  final Value<String?> name;
  final Value<String?> breed;
  final Value<String?> imageUrl;
  final Value<String?> description;
  final Value<String> likeDate;
  final Value<String?> temperament;
  final Value<String?> origin;
  final Value<String?> lifespan;
  final Value<int> rowid;
  const LikedCatsCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.breed = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.description = const Value.absent(),
    this.likeDate = const Value.absent(),
    this.temperament = const Value.absent(),
    this.origin = const Value.absent(),
    this.lifespan = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LikedCatsCompanion.insert({
    required String uuid,
    this.name = const Value.absent(),
    this.breed = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.description = const Value.absent(),
    required String likeDate,
    this.temperament = const Value.absent(),
    this.origin = const Value.absent(),
    this.lifespan = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : uuid = Value(uuid),
       likeDate = Value(likeDate);
  static Insertable<LikedCat> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? breed,
    Expression<String>? imageUrl,
    Expression<String>? description,
    Expression<String>? likeDate,
    Expression<String>? temperament,
    Expression<String>? origin,
    Expression<String>? lifespan,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (breed != null) 'breed': breed,
      if (imageUrl != null) 'image_url': imageUrl,
      if (description != null) 'description': description,
      if (likeDate != null) 'like_date': likeDate,
      if (temperament != null) 'temperament': temperament,
      if (origin != null) 'origin': origin,
      if (lifespan != null) 'lifespan': lifespan,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LikedCatsCompanion copyWith({
    Value<String>? uuid,
    Value<String?>? name,
    Value<String?>? breed,
    Value<String?>? imageUrl,
    Value<String?>? description,
    Value<String>? likeDate,
    Value<String?>? temperament,
    Value<String?>? origin,
    Value<String?>? lifespan,
    Value<int>? rowid,
  }) {
    return LikedCatsCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      breed: breed ?? this.breed,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      likeDate: likeDate ?? this.likeDate,
      temperament: temperament ?? this.temperament,
      origin: origin ?? this.origin,
      lifespan: lifespan ?? this.lifespan,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (breed.present) {
      map['breed'] = Variable<String>(breed.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (likeDate.present) {
      map['like_date'] = Variable<String>(likeDate.value);
    }
    if (temperament.present) {
      map['temperament'] = Variable<String>(temperament.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(origin.value);
    }
    if (lifespan.present) {
      map['lifespan'] = Variable<String>(lifespan.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LikedCatsCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('breed: $breed, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('description: $description, ')
          ..write('likeDate: $likeDate, ')
          ..write('temperament: $temperament, ')
          ..write('origin: $origin, ')
          ..write('lifespan: $lifespan, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LikedCatsTable likedCats = $LikedCatsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [likedCats];
}

typedef $$LikedCatsTableCreateCompanionBuilder =
    LikedCatsCompanion Function({
      required String uuid,
      Value<String?> name,
      Value<String?> breed,
      Value<String?> imageUrl,
      Value<String?> description,
      required String likeDate,
      Value<String?> temperament,
      Value<String?> origin,
      Value<String?> lifespan,
      Value<int> rowid,
    });
typedef $$LikedCatsTableUpdateCompanionBuilder =
    LikedCatsCompanion Function({
      Value<String> uuid,
      Value<String?> name,
      Value<String?> breed,
      Value<String?> imageUrl,
      Value<String?> description,
      Value<String> likeDate,
      Value<String?> temperament,
      Value<String?> origin,
      Value<String?> lifespan,
      Value<int> rowid,
    });

class $$LikedCatsTableFilterComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breed => $composableBuilder(
    column: $table.breed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get likeDate => $composableBuilder(
    column: $table.likeDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get temperament => $composableBuilder(
    column: $table.temperament,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get origin => $composableBuilder(
    column: $table.origin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lifespan => $composableBuilder(
    column: $table.lifespan,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LikedCatsTableOrderingComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breed => $composableBuilder(
    column: $table.breed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get likeDate => $composableBuilder(
    column: $table.likeDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get temperament => $composableBuilder(
    column: $table.temperament,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get origin => $composableBuilder(
    column: $table.origin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lifespan => $composableBuilder(
    column: $table.lifespan,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LikedCatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get breed =>
      $composableBuilder(column: $table.breed, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get likeDate =>
      $composableBuilder(column: $table.likeDate, builder: (column) => column);

  GeneratedColumn<String> get temperament => $composableBuilder(
    column: $table.temperament,
    builder: (column) => column,
  );

  GeneratedColumn<String> get origin =>
      $composableBuilder(column: $table.origin, builder: (column) => column);

  GeneratedColumn<String> get lifespan =>
      $composableBuilder(column: $table.lifespan, builder: (column) => column);
}

class $$LikedCatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LikedCatsTable,
          LikedCat,
          $$LikedCatsTableFilterComposer,
          $$LikedCatsTableOrderingComposer,
          $$LikedCatsTableAnnotationComposer,
          $$LikedCatsTableCreateCompanionBuilder,
          $$LikedCatsTableUpdateCompanionBuilder,
          (LikedCat, BaseReferences<_$AppDatabase, $LikedCatsTable, LikedCat>),
          LikedCat,
          PrefetchHooks Function()
        > {
  $$LikedCatsTableTableManager(_$AppDatabase db, $LikedCatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$LikedCatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$LikedCatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$LikedCatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> breed = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> likeDate = const Value.absent(),
                Value<String?> temperament = const Value.absent(),
                Value<String?> origin = const Value.absent(),
                Value<String?> lifespan = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LikedCatsCompanion(
                uuid: uuid,
                name: name,
                breed: breed,
                imageUrl: imageUrl,
                description: description,
                likeDate: likeDate,
                temperament: temperament,
                origin: origin,
                lifespan: lifespan,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uuid,
                Value<String?> name = const Value.absent(),
                Value<String?> breed = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> description = const Value.absent(),
                required String likeDate,
                Value<String?> temperament = const Value.absent(),
                Value<String?> origin = const Value.absent(),
                Value<String?> lifespan = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LikedCatsCompanion.insert(
                uuid: uuid,
                name: name,
                breed: breed,
                imageUrl: imageUrl,
                description: description,
                likeDate: likeDate,
                temperament: temperament,
                origin: origin,
                lifespan: lifespan,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LikedCatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LikedCatsTable,
      LikedCat,
      $$LikedCatsTableFilterComposer,
      $$LikedCatsTableOrderingComposer,
      $$LikedCatsTableAnnotationComposer,
      $$LikedCatsTableCreateCompanionBuilder,
      $$LikedCatsTableUpdateCompanionBuilder,
      (LikedCat, BaseReferences<_$AppDatabase, $LikedCatsTable, LikedCat>),
      LikedCat,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LikedCatsTableTableManager get likedCats =>
      $$LikedCatsTableTableManager(_db, _db.likedCats);
}
