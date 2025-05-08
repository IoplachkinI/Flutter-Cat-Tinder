import 'dart:collection';
import 'dart:developer';

import 'package:cat_tinder/core/services/stats_service.dart';
import 'package:cat_tinder/core/services/connectivity_service.dart';
import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_swiper/domain/usecases/cat_api/get_cat_from_api.dart';
import 'package:cat_tinder/features/cat_swiper/domain/usecases/cat_api/update_cat_from_api.dart';
import 'package:cat_tinder/features/cat_swiper/domain/usecases/cat_api/init_cats_from_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';

@injectable
class MainScreenViewModel extends ChangeNotifier {
  MainScreenViewModel({
    required this.getCatByInd,
    required this.updateCatByInd,
    required this.initCats,
    required this.statsService,
    required this.connectivityService,
  }) {
    _init();
    _setupConnectivityListener();
  }

  void _setupConnectivityListener() {
    connectivityService.connectionStatus.listen((isConnected) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _isOnline = isConnected;
        if (!isConnected) {
          _loadStats();
        } else {
          if (_catsToUpdate.isNotEmpty) {
            _init();
          }
        }
        notifyListeners();
      });
    });
  }

  Future<void> _loadStats() async {
    final stats = await statsService.loadStats();
    _likeCount = stats['likes'] ?? 0;
    _dislikeCount = stats['dislikes'] ?? 0;
    _updatePercentage();
  }

  void _init() async {
    _isLoading = true;
    notifyListeners();

    await _loadStats();
    if (_isOnline) {
      _isLoadingCats = true;
      notifyListeners();
      await initCats();
      _isLoadingCats = false;
    }

    _isLoading = false;
    _isInitialLoad = false;
    notifyListeners();
  }

  final GetCatFromApi getCatByInd;
  final UpdateCatFromApi updateCatByInd;
  final InitCatsFromApi initCats;
  final StatsService statsService;
  final ConnectivityService connectivityService;

  int _likeCount = 0;
  int _dislikeCount = 0;
  final HashSet<int> _catsToUpdate = HashSet<int>();
  double _lastPercentage = 0.0;
  double _curPercentage = 0.0;
  bool _isOnline = true;
  bool _isLoading = true;
  bool _isInitialLoad = true;
  bool _isLoadingCats = false;

  bool get isOnline => _isOnline;
  bool get isLoading => _isLoading && _isInitialLoad;
  bool get isLoadingCats => _isLoadingCats;

  CatEntity? getCat(int ind) {
    return getCatByInd(ind);
  }

  Future<bool> _retryOperation(
    Future<void> Function() operation,
    int ind,
  ) async {
    int retryCount = 0;
    var maxRetries = _isOnline ? 3 : 1;
    bool success = false;

    while (!success && retryCount < maxRetries) {
      try {
        await operation();
        success = true;
      } catch (e) {
        retryCount++;
        if (retryCount < maxRetries) {
          await Future.delayed(Duration(seconds: 1 << retryCount));
          log(
            'Retrying operation for index $ind (attempt ${retryCount + 1}/$maxRetries)',
          );
        } else {
          log('Failed operation for index $ind after $maxRetries attempts: $e');
          _lastFailedIndex = ind;
          notifyListeners();
          return false;
        }
      }
    }
    return success;
  }

  int? _lastFailedIndex;
  int? get lastFailedIndex => _lastFailedIndex;

  void clearLastFailedIndex() {
    _lastFailedIndex = null;
    notifyListeners();
  }

  Future<void> updateDueCats() async {
    try {
      _isLoadingCats = true;
      notifyListeners();

      final catsToUpdate = Set<int>.from(_catsToUpdate);
      for (final ind in catsToUpdate) {
        await _retryOperation(() async {
          await updateCatByInd(ind);
          _catsToUpdate.remove(ind);
        }, ind);
      }
    } catch (e) {
      log('Error in updateDueCats: $e');
      rethrow;
    } finally {
      _isLoadingCats = false;
      notifyListeners();
    }
  }

  Future<void> updateCat(int ind) async {
    try {
      _isLoadingCats = true;
      notifyListeners();

      await _retryOperation(() async {
        _catsToUpdate.add(ind);
        await updateCatByInd(ind);
        _catsToUpdate.remove(ind);
      }, ind);
    } catch (e) {
      log('Error in updateCat: $e');
      rethrow;
    } finally {
      _isLoadingCats = false;
      notifyListeners();
    }
  }

  void incrementLikes() {
    _likeCount++;
    _updatePercentage();
    statsService.saveStats(likes: _likeCount, dislikes: _dislikeCount);
  }

  void decrementLikes() {
    _likeCount--;
    _updatePercentage();
    statsService.saveStats(likes: _likeCount, dislikes: _dislikeCount);
  }

  void incrementDislikes() {
    _dislikeCount++;
    _updatePercentage();
    statsService.saveStats(likes: _likeCount, dislikes: _dislikeCount);
  }

  void _updatePercentage() {
    _lastPercentage = _curPercentage;
    if (_dislikeCount + _likeCount == 0) {
      _curPercentage = 0.0;
    } else {
      _curPercentage = _dislikeCount / (_dislikeCount + _likeCount);
    }
    notifyListeners();
  }

  double get lastPercentage => _lastPercentage;

  double get curPercentage => _curPercentage;

  int get likeCount => _likeCount;

  int get dislikeCount => _dislikeCount;
}
