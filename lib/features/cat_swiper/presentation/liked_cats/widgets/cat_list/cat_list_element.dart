import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_swiper/presentation/liked_cats/liked_cats_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cat_tinder/features/cat_swiper/presentation/cat_details/view/cat_details.dart';
import 'package:cat_tinder/features/cat_swiper/presentation/main_screen/main_screen_viewmodel.dart';

class CatListElement extends StatelessWidget {
  const CatListElement({super.key, required this.cat, required this.viewModel});

  final CatEntity cat;
  final LikedCatsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(220, 30, 30, 30),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailsScreen(cat: cat)),
          );
        },
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CachedNetworkImage(
            imageUrl: cat.imageUrl ?? "",
            placeholder:
                (context, url) => const Center(
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      color: Colors.white54,
                      strokeWidth: 3,
                    ),
                  ),
                ),
            errorWidget:
                (context, url, error) =>
                    const Icon(Icons.error, color: Colors.white),
            width: 75,
            height: 75,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          cat.breed ?? "",
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          "Liked on: ${cat.likeDate}",
          style: const TextStyle(color: Colors.white),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            Provider.of<MainScreenViewModel>(
              context,
              listen: false,
            ).decrementLikes();
            viewModel.removeCat(cat.uuid);
          },
        ),
      ),
    );
  }
}
