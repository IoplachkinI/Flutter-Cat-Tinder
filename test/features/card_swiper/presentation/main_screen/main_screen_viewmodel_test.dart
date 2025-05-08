import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:cat_tinder/features/cat_swiper/domain/usecases/cat_api/get_cat_from_api.dart';
import 'package:cat_tinder/features/cat_swiper/domain/usecases/cat_api/update_cat_from_api.dart';
import 'package:cat_tinder/features/cat_swiper/domain/usecases/cat_api/init_cats_from_api.dart';
import 'package:cat_tinder/features/cat_swiper/presentation/main_screen/main_screen_viewmodel.dart';
import 'package:cat_tinder/core/services/connectivity_service.dart';
import 'package:cat_tinder/core/services/stats_service.dart';

import 'main_screen_viewmodel_test.mocks.dart';

@GenerateMocks([
  GetCatFromApi,
  UpdateCatFromApi,
  InitCatsFromApi,
  ConnectivityService,
  StatsService,
])
void main() {
  late MainScreenViewModel viewModel;
  late MockGetCatFromApi mockGetCatFromApi;
  late MockUpdateCatFromApi mockUpdateCatFromApi;
  late MockInitCatsFromApi mockInitCatsFromApi;
  late MockConnectivityService mockConnectivityService;
  late MockStatsService mockStatsService;

  setUp(() {
    mockGetCatFromApi = MockGetCatFromApi();
    mockUpdateCatFromApi = MockUpdateCatFromApi();
    mockInitCatsFromApi = MockInitCatsFromApi();
    mockConnectivityService = MockConnectivityService();
    mockStatsService = MockStatsService();

    when(
      mockConnectivityService.connectionStatus,
    ).thenAnswer((_) => Stream.value(true));
    when(mockConnectivityService.isConnected).thenReturn(true);

    when(
      mockStatsService.loadStats(),
    ).thenAnswer((_) async => {'likes': 0, 'dislikes': 0});

    viewModel = MainScreenViewModel(
      getCatByInd: mockGetCatFromApi,
      updateCatByInd: mockUpdateCatFromApi,
      initCats: mockInitCatsFromApi,
      statsService: mockStatsService,
      connectivityService: mockConnectivityService,
    );
  });

  group('Like and Dislike Operations', () {
    test('incrementLikes should increase like count and update percentage', () {
      expect(viewModel.likeCount, 0);
      expect(viewModel.dislikeCount, 0);
      expect(viewModel.curPercentage, 0.0);

      viewModel.incrementLikes();
      expect(viewModel.likeCount, 1);
      expect(viewModel.dislikeCount, 0);
      expect(viewModel.curPercentage, 0.0);
    });

    test(
      'incrementDislikes should increase dislike count and update percentage',
      () {
        expect(viewModel.likeCount, 0);
        expect(viewModel.dislikeCount, 0);
        expect(viewModel.curPercentage, 0.0);

        viewModel.incrementDislikes();
        expect(viewModel.likeCount, 0);
        expect(viewModel.dislikeCount, 1);
        expect(viewModel.curPercentage, 1.0);
      },
    );

    test('decrementLikes should decrease like count and update percentage', () {
      viewModel.incrementLikes();
      viewModel.incrementLikes();
      expect(viewModel.likeCount, 2);

      viewModel.decrementLikes();
      expect(viewModel.likeCount, 1);
    });

    test(
      'percentage calculation should be correct with both likes and dislikes',
      () {
        viewModel.incrementLikes();
        viewModel.incrementLikes();
        viewModel.incrementDislikes();

        expect(viewModel.curPercentage, closeTo(0.333, 0.001));
      },
    );

    test('lastPercentage should store previous percentage value', () {
      viewModel.incrementLikes();
      expect(viewModel.lastPercentage, 0.0);
      expect(viewModel.curPercentage, 0.0);

      viewModel.incrementDislikes();
      expect(viewModel.lastPercentage, 0.0);
      expect(viewModel.curPercentage, 0.5);

      viewModel.incrementLikes();
      expect(viewModel.lastPercentage, 0.5);
      expect(viewModel.curPercentage, closeTo(0.333, 0.001));
    });
  });
}
