import "package:flutter/material.dart";
import "package:cached_network_image/cached_network_image.dart";

import 'package:cat_tinder/core/utils/values/colors.dart';

import "package:cat_tinder/features/cat_swiper/domain/entities/cat_entity.dart";

class CatCard extends StatelessWidget {
  final CatEntity cat;
  final VoidCallback onTap;

  const CatCard({super.key, required this.cat, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Card(
        elevation: 4,
        color: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            GestureDetector(
              onTap: onTap,
              child: CachedNetworkImage(
                imageUrl: cat.imageUrl ?? "",
                placeholder:
                    (context, url) => const SizedBox(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.tertiary,
                        ),
                      ),
                    ),
                errorWidget:
                    (context, url, error) =>
                        const Icon(Icons.error, color: AppColors.secondary),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                fit: BoxFit.cover,
                memCacheWidth: (MediaQuery.of(context).size.width * 2).toInt(),
                memCacheHeight:
                    (MediaQuery.of(context).size.height * 0.5 * 2).toInt(),
                maxWidthDiskCache:
                    (MediaQuery.of(context).size.width * 2).toInt(),
                maxHeightDiskCache:
                    (MediaQuery.of(context).size.height * 0.5 * 2).toInt(),
                fadeInDuration: const Duration(milliseconds: 300),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: AppColors.transparentPrimary,
                height: MediaQuery.of(context).size.height * 0.095,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cat.breed ?? "",
                        style: const TextStyle(
                          color: AppColors.secondary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cat.origin ?? "",
                        style: const TextStyle(
                          color: AppColors.secondary,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
