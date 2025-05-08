import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_swiper/domain/usecases/liked_cats/add_liked_cat.dart';
import 'package:cat_tinder/features/cat_swiper/domain/usecases/liked_cats/get_all_liked_cats.dart';
import 'package:cat_tinder/features/cat_swiper/domain/usecases/liked_cats/get_liked_cats_by_breed.dart';
import 'package:cat_tinder/features/cat_swiper/domain/usecases/liked_cats/remove_liked_cat.dart';
import 'package:cat_tinder/features/cat_swiper/presentation/liked_cats/liked_cats_viewmodel.dart';
import 'package:intl/intl.dart';

import 'liked_cats_viewmodel_test.mocks.dart';

@GenerateMocks([
  AddLikedCat,
  GetAllLikedCats,
  GetLikedCatsByBreed,
  RemoveLikedCat,
])
void main() {
  late LikedCatsViewModel viewModel;
  late MockAddLikedCat mockAddLikedCat;
  late MockGetAllLikedCats mockGetAllLikedCats;
  late MockGetLikedCatsByBreed mockGetLikedCatsByBreed;
  late MockRemoveLikedCat mockRemoveLikedCat;

  setUp(() {
    mockAddLikedCat = MockAddLikedCat();
    mockGetAllLikedCats = MockGetAllLikedCats();
    mockGetLikedCatsByBreed = MockGetLikedCatsByBreed();
    mockRemoveLikedCat = MockRemoveLikedCat();

    when(mockGetAllLikedCats()).thenAnswer((_) => Future.value(<CatEntity>[]));

    viewModel = LikedCatsViewModel(
      addLikedCat: mockAddLikedCat,
      getAllLikedCats: mockGetAllLikedCats,
      getLikedCatsByBreed: mockGetLikedCatsByBreed,
      removeLikedCat: mockRemoveLikedCat,
    );
  });

  test('addCat should call addLikedCat usecase and load cats', () async {
    final cat = CatEntity(
      uuid: '1',
      likeDate: DateFormat('MMM d, y HH:mm:ss').format(DateTime.now()),
    );
    when(mockAddLikedCat(cat)).thenAnswer((_) => Future<void>.value());
    when(mockGetAllLikedCats()).thenAnswer((_) => Future.value(<CatEntity>[]));

    await viewModel.addCat(cat);

    verify(mockAddLikedCat(cat)).called(1);
    verify(mockGetAllLikedCats()).called(1);
  });

  test(
    'removeCat should call removeLikedCat usecase and reset breed filter if needed',
    () async {
      final uuid = '1';
      final breed = 'Persian';
      when(mockRemoveLikedCat(uuid)).thenAnswer((_) => Future<void>.value());
      when(
        mockGetLikedCatsByBreed(breed),
      ).thenAnswer((_) => Future.value(<CatEntity>[]));
      when(
        mockGetAllLikedCats(),
      ).thenAnswer((_) => Future.value(<CatEntity>[]));

      await viewModel.applyBreedFilter(breed);
      await viewModel.removeCat(uuid);

      verify(mockRemoveLikedCat(uuid)).called(1);
      expect(viewModel.getSelectedBreed(), isEmpty);
    },
  );

  test(
    'loadCats should load all cats when no breed filter is applied',
    () async {
      final cats = [
        CatEntity(
          uuid: '1',
          likeDate: DateFormat('MMM d, y HH:mm:ss').format(DateTime.now()),
        ),
      ];
      when(mockGetAllLikedCats()).thenAnswer((_) => Future.value(cats));

      await viewModel.loadCats();

      verify(mockGetAllLikedCats()).called(1);
      expect(viewModel.cats, equals(cats));
    },
  );

  test(
    'loadCats should load filtered cats when breed filter is applied',
    () async {
      final breed = 'Persian';
      final allCats = [
        CatEntity(
          uuid: '1',
          likeDate: DateFormat('MMM d, y HH:mm:ss').format(DateTime.now()),
          breed: breed,
        ),
        CatEntity(
          uuid: '2',
          likeDate: DateFormat('MMM d, y HH:mm:ss').format(DateTime.now()),
          breed: 'Other',
        ),
      ];
      when(mockGetAllLikedCats()).thenAnswer((_) => Future.value(allCats));

      await viewModel.applyBreedFilter(breed);

      clearInteractions(mockGetAllLikedCats);

      await viewModel.loadCats();

      verify(mockGetAllLikedCats()).called(1);
      expect(viewModel.cats, equals([allCats[0]]));
    },
  );

  test(
    'applyBreedFilter should update selected breed and load filtered cats',
    () async {
      final breed = 'Persian';
      final allCats = [
        CatEntity(
          uuid: '1',
          likeDate: DateFormat('MMM d, y HH:mm:ss').format(DateTime.now()),
          breed: breed,
        ),
        CatEntity(
          uuid: '2',
          likeDate: DateFormat('MMM d, y HH:mm:ss').format(DateTime.now()),
          breed: 'Other',
        ),
      ];
      when(mockGetAllLikedCats()).thenAnswer((_) => Future.value(allCats));

      await viewModel.applyBreedFilter(breed);

      verify(mockGetAllLikedCats()).called(1);
      expect(viewModel.getSelectedBreed(), equals(breed));
      expect(viewModel.cats, equals([allCats[0]]));
    },
  );
}
