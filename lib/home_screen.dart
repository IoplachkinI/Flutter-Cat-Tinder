import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'cat_provider.dart';
import 'cat_detail_screen.dart';
import 'cat_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Домашний экран с котиком")),
      body: Center(child: CatCard(text: 'asdf')),
    );
  }
}
