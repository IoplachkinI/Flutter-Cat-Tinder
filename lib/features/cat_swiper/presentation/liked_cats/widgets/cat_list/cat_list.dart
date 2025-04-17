import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_swiper/presentation/liked_cats/liked_cats_viewmodel.dart';
import 'package:flutter/cupertino.dart';

import 'cat_list_element.dart';

class CatList extends StatelessWidget {
  const CatList({super.key, required this.cats, required this.viewModel});

  final List<CatEntity> cats;
  final LikedCatsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: cats.length,
      itemBuilder: (context, index) {
        return CatListElement(cat: cats[index], viewModel: viewModel);
      },
    );
  }
}
