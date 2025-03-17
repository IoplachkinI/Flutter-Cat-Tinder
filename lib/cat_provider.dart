import 'package:flutter/material.dart';
import 'cat.dart';

class CatProvider with ChangeNotifier {
  List<Cat> _cats = [];
  int _likes = 0;

  List<Cat> get cats => _cats;
  int get likes => _likes;

  void likeCat() {
    _likes++;
    notifyListeners();
  }

  void fetchCats() async {
    // Здесь должен быть код для получения данных о котиках из API
    // Например, используя пакет http
    _cats = [
      Cat(
        imageUrl: 'https://cs6.pikabu.ru/post_img/big/2015/04/22/6/1429692428_1937325974.jpg',
        breed: 'Персидская',
        description: 'Описание персидской кошки...',
      ),
      Cat(
        imageUrl: 'https://cs6.pikabu.ru/post_img/big/2015/04/22/6/1429692428_1937325974.jpg',
        breed: 'Сиамская',
        description: 'Описание сиамской кошки...',
      ),
    ];
    notifyListeners();
  }
}