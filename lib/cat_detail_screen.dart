import 'package:flutter/material.dart';
import 'cat.dart';

class CatDetailScreen extends StatelessWidget {
  final Cat cat;

  CatDetailScreen({required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cat.breed),
      ),
      body: Column(
        children: [
          Image.network(cat.imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(cat.description),
          ),
        ],
      ),
    );
  }
}