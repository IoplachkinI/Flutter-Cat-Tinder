// Mocks generated by Mockito 5.4.6 from annotations
// in cat_tinder/test/features/card_swiper/presentation/liked_cats/liked_cats_viewmodel_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart'
    as _i5;
import 'package:cat_tinder/features/cat_swiper/domain/repositories/liked_cats_repository.dart'
    as _i2;
import 'package:cat_tinder/features/cat_swiper/domain/usecases/liked_cats/add_liked_cat.dart'
    as _i3;
import 'package:cat_tinder/features/cat_swiper/domain/usecases/liked_cats/get_all_liked_cats.dart'
    as _i6;
import 'package:cat_tinder/features/cat_swiper/domain/usecases/liked_cats/get_liked_cats_by_breed.dart'
    as _i7;
import 'package:cat_tinder/features/cat_swiper/domain/usecases/liked_cats/remove_liked_cat.dart'
    as _i8;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeLikedCatsRepository_0 extends _i1.SmartFake
    implements _i2.LikedCatsRepository {
  _FakeLikedCatsRepository_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [AddLikedCat].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddLikedCat extends _i1.Mock implements _i3.AddLikedCat {
  MockAddLikedCat() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.LikedCatsRepository get repository =>
      (super.noSuchMethod(
            Invocation.getter(#repository),
            returnValue: _FakeLikedCatsRepository_0(
              this,
              Invocation.getter(#repository),
            ),
          )
          as _i2.LikedCatsRepository);

  @override
  _i4.Future<void> call(_i5.CatEntity? cat) =>
      (super.noSuchMethod(
            Invocation.method(#call, [cat]),
            returnValue: _i4.Future<void>.value(),
            returnValueForMissingStub: _i4.Future<void>.value(),
          )
          as _i4.Future<void>);
}

/// A class which mocks [GetAllLikedCats].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAllLikedCats extends _i1.Mock implements _i6.GetAllLikedCats {
  MockGetAllLikedCats() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.LikedCatsRepository get repository =>
      (super.noSuchMethod(
            Invocation.getter(#repository),
            returnValue: _FakeLikedCatsRepository_0(
              this,
              Invocation.getter(#repository),
            ),
          )
          as _i2.LikedCatsRepository);

  @override
  _i4.Future<List<_i5.CatEntity>> call() =>
      (super.noSuchMethod(
            Invocation.method(#call, []),
            returnValue: _i4.Future<List<_i5.CatEntity>>.value(
              <_i5.CatEntity>[],
            ),
          )
          as _i4.Future<List<_i5.CatEntity>>);
}

/// A class which mocks [GetLikedCatsByBreed].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetLikedCatsByBreed extends _i1.Mock
    implements _i7.GetLikedCatsByBreed {
  MockGetLikedCatsByBreed() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.LikedCatsRepository get repository =>
      (super.noSuchMethod(
            Invocation.getter(#repository),
            returnValue: _FakeLikedCatsRepository_0(
              this,
              Invocation.getter(#repository),
            ),
          )
          as _i2.LikedCatsRepository);

  @override
  _i4.Future<List<_i5.CatEntity>> call(String? breed) =>
      (super.noSuchMethod(
            Invocation.method(#call, [breed]),
            returnValue: _i4.Future<List<_i5.CatEntity>>.value(
              <_i5.CatEntity>[],
            ),
          )
          as _i4.Future<List<_i5.CatEntity>>);
}

/// A class which mocks [RemoveLikedCat].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveLikedCat extends _i1.Mock implements _i8.RemoveLikedCat {
  MockRemoveLikedCat() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.LikedCatsRepository get repository =>
      (super.noSuchMethod(
            Invocation.getter(#repository),
            returnValue: _FakeLikedCatsRepository_0(
              this,
              Invocation.getter(#repository),
            ),
          )
          as _i2.LikedCatsRepository);

  @override
  _i4.Future<void> call(String? uuid) =>
      (super.noSuchMethod(
            Invocation.method(#call, [uuid]),
            returnValue: _i4.Future<void>.value(),
            returnValueForMissingStub: _i4.Future<void>.value(),
          )
          as _i4.Future<void>);
}
