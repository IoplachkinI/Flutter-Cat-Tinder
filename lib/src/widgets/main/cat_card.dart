import "package:flutter/material.dart";
import "package:cached_network_image/cached_network_image.dart";

import "package:cat_tinder/src/models/cat.dart";

class CatCard extends StatelessWidget {
  final Cat catInfo;
  final VoidCallback onTap;

  const CatCard({super.key, required this.catInfo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Card(
        elevation: 4,
        color: const Color.fromARGB(255, 30, 30, 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            GestureDetector(
              onTap: onTap,
              child: CachedNetworkImage(
                imageUrl: catInfo.imageUrl,
                placeholder:
                    (context, url) => const SizedBox(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: CircularProgressIndicator(color: Colors.white54),
                      ),
                    ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: const Color.fromARGB(220, 30, 30, 30),
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
                        catInfo.breed,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        catInfo.origin,
                        style: const TextStyle(
                          color: Colors.white,
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
